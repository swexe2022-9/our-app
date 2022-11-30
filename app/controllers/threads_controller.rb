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
    
        @threads = Thre.new(title: params[:thre][:title],
        user_id: session[:login_uid])
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
        @threads = Thre.includes(:comments).find(params[:id])
        @threads = Thre.find(params[:id])
    end
    
    def edit
        @threads = Thre.find(params[:id])
    end
    
    def update
        @threads = Thre.find(params[:id])
        @threads.update(title: params[:thre][:title])
        if @threads.save
            redirect_to root_path
        else 
            new_thread_path
        end
        #@thread = Thre.find(params[:id])
        #@thread.update(title: params[:thre][:message])
    end
    
    
end
