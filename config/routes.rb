Rails.application.routes.draw do
  get 'homes/top'
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
    resource :records, except: [:new,:index,:edit]
    resources :past_records, except: [:new,:create,:edit]
    resources :groups, except: [:new,:destroy] do
      resources :group_users, only: [:create,:destroy], param: :user_id
      resources :post_threads, except: [:new]
    end
  end
  
  # 管理者用
  namespace :admin do
    
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
