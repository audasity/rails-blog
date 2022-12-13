class ArticlesController < ApplicationController

  def index
    @articles = current_user.articles
    @all_articles = Article.all.select { |article| article.status == "public" }
    @current_user = current_user.id
  end

  def show
    @article = current_user.articles.find(params[:id])
  end

  def new
    @article = current_user.articles.build
  end

  def truncate(string, max)
    string.length > max ? "#{string[0...max]}..." : string
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end

end
