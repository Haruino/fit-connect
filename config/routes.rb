Rails.application.routes.draw do
  # 会員用
  # URL /user/sign_in ...
  devise_for :user,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  root to: "homes#top"
  
  # ユーザー用
  scope module: :public do
    resources :users,           only:   [:show,:update,:edit] do
      get :favorites,             on: :member
      get :withdraw,              on: :member
      resource :relationships,    only: [:create,:destroy] 
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers'  => 'relationships#followers',  as: 'followers'
      resource  :records,         except: [:new,:index,:edit]
      resources :past_records,    except: [:new,:create,:edit]
    end
    resources :groups,          except: [:new,:destroy] do
      resources :group_users,   only:   [:create,:destroy], param: :user_id
      resources :post_threads,  except: [:new,:index,:create], as: 'post_threads', shallow: true do
        resources :comments,      only: [:create]
        delete 'comments/:id',    to: 'comments#destroy', as: 'comment'
        resources :favorites,     only:   [:create]
        delete 'favorites/:id',   to: 'favorites#destroy', as: 'favorite'
      end
    end
  end
  
  # 管理者用
  namespace :admin do
    resources :users,           except: [:new,:create,:destroy] 
    resources :genres,          except: [:new,:show]
    resources :groups,          only:   [:index,:show,:destroy] do
      resources :group_users,     only:   [:destroy]
      resources :post_threads,    except: [:new,:create], shallow: true do
        delete 'comments/:id',      to: 'comments#destroy', as: 'comment'
      end
    end
    get 'comments'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
