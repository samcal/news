class ArticlesController < ApplicationController
	before_action :require_login, except: [:index, :show]

	def index
    @articles = Article.published.order('created_at DESC').paginate(:page => params[:page])
	end

	def show
		@article = Article.friendly.find(params[:id])

		if @article.is_draft and @article.user != current_user
			redirect_to root_path
		end

		if not (@article.is_published or user_signed_in?)
			redirect_to root_path
		end

		@current_category = @article.category
		@similar_articles = @article.similar_articles
		unless request.path == article_path(@article)
			redirect_to @article, status: :moved_permanently
		end
	end

	def edit
		@article = Article.friendly.find(params[:id])
		if not (@article.user == current_user or current_user.editor?)
			redirect_to root_path
		else
			render layout: 'dashboard'
		end
	end

	def update
		@article = Article.friendly.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def new
		@article = Article.new
		render layout: 'dashboard'
	end

	def create
		@article = Article.new(article_params)
		@article.save
		redirect_to @article
	end

	private
		def article_params
			params.require(:article).permit(:title, :author_name, :category_id, :image, :caption, :text)
		end

end
