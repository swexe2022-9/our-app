class CommentsController < ApplicationController
    
    def create
     #@comment = Comment.new(comment: params[:comment][:comment])
     @thread = Thre.find(params[:thread_id])
     @comment = Comment.new(params_comment)
     ##@comment = @thread.comments.new(params_comment)
     @comment.thre = @thread#モデルの
     #@comment = Comment.new(params_comment)
     
     
     
     if @comment.save
       redirect_to thread_url(@thread)
     else
       render "threads/show"
     end
     
    end

 
   private
   
   def params_comment
     params.require(:comment).permit(:comment,:user_id,:uidentifer).merge(user_id: session[:login_uid])
   end
end
