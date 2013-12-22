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
		let(:article) { create(:article) }

		it "responds successfully with an HTTP 200 status code" do
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

		it "redirects to new url if title (and slug) change" do
			slug = article.slug
			article.title = 'Different Title'
			article.slug = nil
			article.save!
			get :show, id: slug
			expect(response.status).to eq(301)
		end
	end

	describe "GET new" do
		it "redirects to home if not authenticated" do
			get :new
			expect(response).to redirect_to(root_path)
		end
	end

	describe "POST create" do
		context "if not authenticated" do
			it "redirects to home if not authenticated" do
				article = attributes_for(:article)
				post :create, :article => article
				expect(response).to redirect_to(root_path)
			end
		end

		context "if authenticated" do
			before do
				sign_in create(:user)
				@article = attributes_for(:article)
				post :create, :article => @article
				@instance = Article.last
			end

			it "creates an article" do
				@instance.title.should == @article[:title]
			end

			it "redirects to the article page" do
				expect(response).to redirect_to(article_path(@instance.slug))
			end
		end
	end
end
