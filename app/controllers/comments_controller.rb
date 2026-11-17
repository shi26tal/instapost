class CommentsController < ApplicationController
  before_action :authenticate_user, only: [ :create, :destroy ]

  def create
    # find the post - extract post ID from url
    @post = Post.find(params[:post_id])

    # creating new cmt associated with that post
    #  @post.comment - accesses all cmt that belong to thhis post
    @comment = @post.comments.create(
      # comment_params - text
      # merge - Ruby hash method. It combine two hashes into one
      # user_id: current_user.id - current user ko id ra text merge garxa
      comment_params.merge(user_id: current_user.id)
    )

    if @comment.valid?
      redirect_to root_path
    else
      flash[:alert] = "Invalid params"
      redirect_to root_path
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    unless @comment.user == current_user
      redirect_to root_path
    end

    @comment.destroy
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
