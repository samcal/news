class API::V1::ArticlesController < ApplicationController

  def index
    @articles = Article.all.order('created_at DESC')
    respond_to do |format|
      format.json { render :json => @articles }
    end
  end

  def show
    @article = Article.friendly.find(params[:id])
    respond_to do |format|
      format.json { render :json => @article }
    end
  end

end