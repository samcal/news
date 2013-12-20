require 'spec_helper'

describe ArticlesController do
	describe "GET index" do
		it "responds successfully with an HTTP 200 status code" do
			get :index
			expect(response).to be_success
			expect(response.status).to eq(200)
		end

		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end

		it "loads all of the articles into @articles" do
			article1, article2 = create(:article), create(:article)
			get :index
			expect(assigns(:articles)).to match_array([article1, article2])
		end
	end

	describe "GET show" do
		it "responds successfully with an HTTP 200 status code" do
			article = create(:article)
			get :show, id: article.slug
			expect(response).to be_success
			expect(response.status).to eq(200)
		end

		it "renders the show template" do
			article = create(:article)
			get :show, id: article.slug
			expect(response).to render_template("show")
		end

		it "loads the article into @article" do
			article = create(:article)
			get :show, id: article.slug
			expect(assigns(:article)).to eq(article)
		end
	end

	describe "GET new" do
		it "redirects to home if not authenticated" do
			get :new
			expect(response).to redirect_to(root_path)
		end
	end
end
