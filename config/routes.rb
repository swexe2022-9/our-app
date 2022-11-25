Rails.application.routes.draw do
    resources:threads do
        resources :comments, only: [:create, :destroy]
    end
    resources:users, only: [:new, :create]
    get 'users/new'
    get 'top/login'
    post 'top/login'
    get 'top/logout'

    root 'threads#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
