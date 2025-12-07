class CommentsController < ApplicationController
  skip_forgery_protection
  before_action :set_post

  def create
    @post.comments.create! params.expect(comment: [ :content  ])
    # respond_to do |format|
    #   format.turbo_stream { redirect_to @post }
    #
    #   format.html { redirect_to @post }
    # end

    redirect_to @post
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
