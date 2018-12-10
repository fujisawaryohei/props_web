class CommentsController < ApplicationController

  def create
   @comment = Comment.new(set_params)
   post_id = params[:comment][:post_id]
   if @comment.save
     redirect_to "/posts/#{post_id}"
   else
     redirect_to "/posts/#{post_id}"
   end
  end

  def destroy
  end

  private

  def set_params
    params.require(:comment).permit(:post_id,:user_id,:comment_text)
  end

end
