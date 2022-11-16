class ThreadsController < ApplicationController
    
    def index
        @threads = Thre.all
    end
    
    def new 
        @threads = Thre.new
    end
    
    def create
        @threads = Thre.new(title: params[:thre][:title],uname: session[:uname])
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
    end
end
