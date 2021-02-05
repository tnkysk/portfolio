class PostCommentsController < ApplicationController

  def create
    bagel = Bagel.find(params[:bagel_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.bagel_id = bagel.id
    comment.save
    redirect_to bagel_path(bagel)
  end

  def destroy
  	PostComment.find_by(id: params[:id], bagel_id: params[:bagel_id]).destroy
    redirect_to bagel_path(params[:bagel_id])
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
