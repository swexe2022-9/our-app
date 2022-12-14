Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
    resources:threads do
        resources :comments, only: [:create, :destroy]
        
    end
    get 'get_image/:id', to: 'threads#get_image'
    get 'get_image/:id', to: 'comments#get_image'
    resources:users, only: [:new, :create]
    
    get 'users/new'
    get 'top/login'
    post 'top/login'
    get 'top/logout'

    
    get 'users/index'

    root 'threads#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
