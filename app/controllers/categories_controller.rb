class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def show
    @current_category = @category
    @articles = @category.articles.published.order('created_at DESC').paginate(:page => params[:page])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.friendly.find(params[:id])
    end
end
