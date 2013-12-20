require 'spec_helper'

describe CommentsController do
	describe "POST create" do
		it "creates a comment" do
			article = create(:article)
			comment = attributes_for(:comment)
			comment[:article_id] = article.id
			post :create, :comment => comment
			article.comments.last.name.should == comment[:name]
		end
	end
end
