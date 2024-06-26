Rails.application.routes.draw do
  # ユーザー用
  devise_for :user,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_scope :user do
    post "user/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  scope module: :public do
    resources :users,         except:   [:new,:create,:destroy] do
      get :favorites,             on: :member
      patch :withdraw,              on: :member
      resource :relationships,    only: [:create,:destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers'  => 'relationships#followers',  as: 'followers'
      resource  :records,         only: [:create,:show] do
        resources :parts, only: [:create, :destroy]
        resources :exercises, only: [:create, :destroy]
        get 'parts_exercises' => 'records#parts_exercises', as: 'parts_exercises'
      end
      resources :records,         only: [:update, :destroy]
      resources :past_records,    only: [:index,:show,:destroy], param: :date
    end
    resources :groups,          except: [:new,:destroy] do
      resources :members,       only:   [:index, :create,:destroy]
      resources :post_threads,  only:   [:create, :show, :destroy], as: 'post_threads', shallow: true do
        resources :comments,      only: [:create]
        delete 'comments/:id',    to: 'comments#destroy', as: 'comment'
        resource :favorites,      only: [:create, :destroy]
      end
    end
  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :users,           only: [:index, :show] do
      patch :withdraw,              on: :member
    end
    resources :genres,          except: [:new,:show]
    resources :groups,          only:   [:index,:show,:destroy] do
      resources :members,         only:   [:index, :destroy]
      resources :post_threads,    only:   [:show, :destroy], shallow: true do
        delete 'comments/:id',      to: 'comments#destroy', as: 'comment'
      end
    end
    get 'comments', to: 'comments#index', as: 'comments'
  end
  
  # 共通
  root to: "homes#top"
  get "/search" => "homes#search"
end
