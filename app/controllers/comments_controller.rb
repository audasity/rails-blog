class CommentsController < ApplicationController
  # before_action is a filter, which is a method used when controller is called.
  # Since we want the filter to run before any action is taken, it is before_action
  before_action :authenticate_user!, :except => [:index]
  # :except => [:index] allows all users to access index route but only authenticated users
  # can access other routes in the comments controller.

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
  