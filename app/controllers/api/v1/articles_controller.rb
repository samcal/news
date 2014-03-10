class API::V1::ArticlesController < ApplicationController

  def index
    params[:page] ? paginate : all
  end

  def show
    @article = Article.published.friendly.find(params[:id])
    render json: @article
  end
  
  private
    def paginate
      @articles = Article.published.paginate(:page => params[:page])
      render json: @articles
    end

    def all
      @articles = Article.published.order('created_at DESC')
      render json: @articles
    end

end