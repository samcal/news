class CommentsController < ApplicationController
	def new
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.save
		redirect_to @comment.article
	end

	private
		def comment_params
			params.require(:comment).permit(:name, :email, :body, :article_id)
		end
end