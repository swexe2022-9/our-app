Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
    resources:threads do
        resources :comments, only: [:create, :destroy]
        
    end
    get 'get_image/:id', to: 'threads#get_image'
     
    resources:users, only: [:new, :create]
    
    get 'users/new'
    get 'top/login'
    post 'top/login'
    get 'top/logout'

    
    get 'users/index'
    
    get 'search' => 'threads#search'
    get 'search_blog' => 'blogs#search_blog'
    
    resources:blogs
    get 'get_blog_image/:id', to: 'blogs#get_blog_image'
    
    
    root 'threads#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
