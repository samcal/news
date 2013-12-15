class ArticlesController < ApplicationController
	def index
		@articles = Article.all.reverse
	end

	def new
	end

	def show
		@article = Article.friendly.find(params[:id])
		@current_category = @article.category
		a_ids = @current_category.article_ids
		a_ids.delete(@article.id)
		@similar_articles = Article.where(:id => a_ids.sort_by { rand }.slice(0,3))
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
			params.require(:article).permit(:title, :author_name, :category, :image, :text)
		end

end
