class Posts::UpvotesController < ApplicationController
  def create
    # post khojxa jasko post like bhako
    @post = Post.find(params[:post_id])
    # registers tha loggedin user's ko like
    @post.liked_by current_user

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "post_#{params[:post_id]}_container",
          partial: "posts/likes",
          locals: { post: @post }
        )
      end
    end
  end
end
