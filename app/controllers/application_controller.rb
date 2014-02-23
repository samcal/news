class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :get_categories, :get_headlines

  private
  
  def get_categories
  	@categories = Category.all
  end

  def get_headlines
    @headlines = Article.published.order('created_at DESC').limit(7)
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to do that..."
      redirect_to root_path
    end
  end
end
