require 'spec_helper'

describe CommentsController do
	describe "POST #create" do
    let(:article) { create(:article) }
    let(:comment) { attributes_for(:comment, article_id: article.id) }

    before do
      post :create, :comment => comment
    end

		it "creates a comment" do
			expect(article.comments.last.name).to eq(comment[:name])
		end
	end
end
