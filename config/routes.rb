Rails.application.routes.draw do
  get 'homes/top'
  # 顧客用
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

  scope module: :public do
    resource :records, except: [:edit]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
