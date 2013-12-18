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
			article1, article2 = Article.create!, Article.create!
			get :index
			expect(assigns(:articles)).to match_array([article1, article2])
		end
	end

	describe "GET show" do
		it "responds successfully with an HTTP 200 status code" do
			article = Category.create!.articles.create!
			get :show, id: article.id
			expect(response).to be_success
			expect(response.status).to eq(200)
		end

		it "renders the show template" do
			article = Category.create!.articles.create!
			get :show, id: article.id
			expect(response).to render_template("show")
		end

		it "loads the article into @article" do
			article = Category.create!.articles.create!
			get :show, id: article.id
			expect(assigns(:article)).to eq(article)
		end
	end

	describe "POST create" do
		it "passes params to article model" do
			post :create, :article => {:title => 'Article Title'}
			assigns(:article).title.should == 'Article Title'
		end
	end
end
