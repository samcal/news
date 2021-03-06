class API::V1::CategoriesController < ApplicationController

  def index
    @categories = Category.all
    respond_to do |format|
      format.json { render :json => @categories }
    end
  end

  def show
    @category = Category.friendly.find(params[:id])
    respond_to do |format|
      format.json { render :json => @category }
    end
  end

end