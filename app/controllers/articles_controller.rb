class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def create
    Article.new(article_params).save

    redirect_to articles_path
  end

  def new
    @article = Article.new
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(params[:id])
  end

  def edit
    @article = Article.find(params[:id])

  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to articles_path, status: :see_other
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
