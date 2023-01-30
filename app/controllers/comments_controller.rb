# frozen_string_literal: true

class CommentsController < ApplicationController
  # before_action is a filter, which is a method used when controller is called.
  # Since we want the filter to run before any action is taken, it is before_action
  before_action :authenticate_user!, except: [:index]
  before_action :current_article, only: [:create]
  before_action :current_comment, except: [:update, :create]
  # :except => [:index] allows all users to access index route but only authenticated users
  # can access other routes in the comments controller.

  def create
    @comment = @article.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save!
    redirect_to article_path(@article)
  end

  def destroy
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  def edit
  end

  def update
    @article = current_user.articles.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def show
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end

  def current_article
    @article = Article.find(params[:article_id])
  end

  def current_comment
    @comment = current_article.comments.find(params[:id])
  end
end
