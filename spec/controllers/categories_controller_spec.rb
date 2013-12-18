require 'spec_helper'

describe CategoriesController do
	describe "GET show" do
		it "responds successfully with an HTTP 200 status code" do
			category = Category.create!
			get :show, id: category.id
			expect(response).to be_success
			expect(response.status).to eq(200)
		end

		it "renders the show template" do
			category = Category.create!
			get :show, id: category.id
			expect(response).to render_template("show")
		end

		it "loads the category into @category" do
			category = Category.create!
			get :show, id: category.id
			expect(assigns(:category)).to eq(category)
		end
	end
end
