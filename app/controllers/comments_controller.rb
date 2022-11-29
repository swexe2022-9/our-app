class CommentsController < ApplicationController
    def create
     @thread = Thre.find(params[:thread_id])
     @comment = Comment.new(params_comment)
     @comment.thread = @thread
 
     if @comment.save
       redirect_to thread_url(@thread)
     else
       render "threads/show"
     end
     
    end
 
   private
 
   def params_comment
     params.require(:comment).permit(:comment)
   end
end
