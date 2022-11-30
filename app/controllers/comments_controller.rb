class CommentsController < ApplicationController
    def create
     
     @comment = Comment.new(comment: params[:comment][:comment])
     #@comment = Comment.new(params_comment)
     ##@comment = @thread.comments.new(params_comment)
     #@comment.thread = @thread
     #@comment = Comment.new(params_comment)
     
 
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
