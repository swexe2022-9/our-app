class BlogsController < ApplicationController
    
        
    def index
        @blogs = Blog.all
    end
    
    def new 
        @blogs = Blog.new
    end
    
    def create
        
        if params[:blog][:image] == nil
            
            @blogs = Blog.new(title: params[:blog][:title],
            body: params[:blog][:body],
            user_id: session[:login_uid])
        else
            @blogs = Blog.new(title: params[:blog][:body],
            body: params[:blog][:body],
            user_id: session[:login_uid],
            image: params[:blog][:image].read)

        end
        if @blogs.save
            redirect_to blogs_path
        end
        
        
    end
    
    def destroy
        @blogs = Blog.find(params[:id])
        @blogs.destroy
        redirect_to blogs_path
    end
    
    def show
        @blogs =Blog.find(params[:id])
    end
    
    def edit
        @blogs =Blog.find(params[:id])
    end
    
    def update
        @blogs =Blog.find(params[:id])
        @blogs.update(title: params[:blog][:title],
        body: params[:blog][:body],
        image: params[:blog][:image].read)
      
        if @blogs.save
            redirect_to blogs_path
        else 
            new_blog_path
        end
    end
    
    def get_blog_image
        @blogs = Blog.find(params[:id]) 
        send_data @blogs.image, disposition: :inline, type: 'image/jpg'
 
    end
 
    
    def search_blog
        @blogs = Blog.search_blog(params[:keyword])
        @keyword = params[:keyword]
        render "index"
    end
    
end
