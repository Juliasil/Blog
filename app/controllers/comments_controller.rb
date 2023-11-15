class CommentsController < ApplicationController
  def create
    comment = Comment.create!(comments_params)

    redirect_to comment.blog_post, notice: 'O seu comentário foi enviado.'
  end
  private
  def comments_params
    params.require(:comment).permit(:blog_post_id, :author, :body)
  end
end