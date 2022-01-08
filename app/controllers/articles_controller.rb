class ArticlesController < ApplicationController
  def show
    # params is a hash that's passed into the request
    # :id is the id of the resource (id at the end of the URL)
    # byebug  # pause here
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new  # to prevent NPE error when loading "new" page for the first time
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))

    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to articles_path
    else
      render 'new'
    end

  end
end