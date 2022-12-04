Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
    resources:threads do
        resources :comments, only: [:create, :destroy]
    end
    resources:users, only: [:new, :create]
    get 'users/new'
    get 'top/login'
    post 'top/login'
    get 'top/logout'
    
<<<<<<< HEAD
    get 'users/index'

=======
    
    get 'users/index'
>>>>>>> f3f5d1ef2a22b34df80e59d41327f20f6925f524
    root 'threads#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
