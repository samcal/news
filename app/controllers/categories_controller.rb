class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def show
    @current_category = @category
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end
end
