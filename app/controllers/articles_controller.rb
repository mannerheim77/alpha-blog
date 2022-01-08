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

  end

  def create
    #render plain: params[:article]

    # will result in a ForbiddenAttributesError.  Because you need to whitelist what's coming in from the web
    # @article = Article.new(params[:article])

    #require top-level key of article and permit title and description to be used to create article object
    @article = Article.new(params.require(:article).permit(:title, :description))

    @article.save

    # redirect_to article_path(@article)
    # redirect_to @article  #a shortcut for the previous statement

    redirect_to articles_path

    # render plain: @article.inspect
  end
end