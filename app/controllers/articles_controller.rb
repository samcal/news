class ArticlesController < ApplicationController
	def index
		@articles = Article.all.reverse
	end

	def new
	end

	def show
		@article = Article.friendly.find(params[:id])
		unless request.path == article_path(@article)
			redirect_to @article, status: :moved_permanently
		end
	end

	def create
		@article = Article.new(article_params)
		@article.save
		redirect_to @article
	end

	private
		def article_params
			params.require(:article).permit(:title, :author_name, :image, :text)
		end

end
