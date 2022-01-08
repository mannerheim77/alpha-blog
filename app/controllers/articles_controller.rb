class ArticlesController < ApplicationController
  def show
    # params is a hash that's passed into the request
    # :id is the id of the resource (id at the end of the URL)
    # byebug  # pause here
    @article = Article.find(params[:id])
  end
end