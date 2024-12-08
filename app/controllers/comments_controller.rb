class CommentsController < ApplicationController
  before_action :set_post

  def create
    # rails 8 way =>
    # @post.comments.create! params.expect( comment: [ :content ])

    # rails 7 way =>
    @post.comments.create! params.require(:comment).permit(:content)

    redirect_to posts_path, notice: "Comment created"
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
