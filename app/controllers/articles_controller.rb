class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show; end

  def index
    @articles = Article.all.order!('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    #temporarily assign to first user until we implement real login
    @article.user = User.first

    if @article.save
      flash[:notice] = 'Article was created successfully.'
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was updated successfully.'
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy

    # have to tack on the status of 303 for workaround in apparent bug
    # in which rails redirects using DELETE instead of GET
    redirect_to articles_path, status: 303
  end

  private

  def article_params
    params.require(:article).permit(:title, :author, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
