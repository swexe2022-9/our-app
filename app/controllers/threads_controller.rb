class ThreadsController < ApplicationController
    
    def index
        @threads = Thre.all
        #@users = User.find(params[:id])
    end
    def new 
        @threads = Thre.new
        #@thread = Thre.new
    end
    
    def create
        
        if params[:thre][:image] == nil
            
            @threads = Thre.new(title: params[:thre][:title],
            user_id: session[:login_uid])
        else
             @threads = Thre.new(title: params[:thre][:title],
            user_id: session[:login_uid],
            image: params[:thre][:image].read)
        end
       
        #@thread = Thre.new(message: params[:thre][:message])
        if @threads.save 
            redirect_to root_path
        end
        
        
    end
    
    def destroy
        @threads = Thre.find(params[:id])
        @threads.destroy
        redirect_to root_path
    end
    
    def show
        @threads = Thre.find(params[:id])
        @threads = Thre.includes(:comments).find(params[:id])
        @comment = Comment.new
        
    end
    
    def edit
        @threads = Thre.find(params[:id])
    end
    
    def update
        file = params[:thre][:image].read
        @threads = Thre.find(params[:id])
        @threads.update(title: params[:thre][:title],
        image: file)
        if @threads.save
            redirect_to root_path
        else 
            new_thread_path
        end
        #@thread = Thre.find(params[:id])
        #@thread.update(title: params[:thre][:message])
    end
    
    def get_image
        @threads = Thre.find(params[:id]) 
        send_data @threads.image, disposition: :inline, type: 'image/jpg'
    end
    
    
end
