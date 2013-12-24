class ArticlesController < ApplicationController
	before_action :require_login, only: [:new, :create]

	def index
		@articles = Article.all.reverse
	end

	def show
		@article = Article.friendly.find(params[:id])
		@current_category = @article.category
		@similar_articles = @article.similar_articles
		unless request.path == article_path(@article)
			redirect_to @article, status: :moved_permanently
		end
	end

	def create
		puts params
		puts article_params
		@article = Article.new(article_params)
		@article.save
		redirect_to @article
	end

	private
		def article_params
			params.require(:article).permit(:title, :author_name, :category_id, :image, :text)
		end

		def require_login
			unless user_signed_in?
				flash[:error] = "You must be logged in to do that..."
				redirect_to root_path
			end
		end

end
