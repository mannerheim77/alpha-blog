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
      flash[:notice] = 'Article was created successfully.'
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    # first way to update is just call setters and then save:
    #
    # new_params = params.require(:article).permit(:title, :description)
    # @article.title = new_params[:title]
    # @article.description = new_params[:description]
    #
    # if @article.save
    #
    # Better way is to call the update method:
    #
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = 'Article was updated successfully.'
      redirect_to articles_path
    else
      render 'edit'
    end

  end
end