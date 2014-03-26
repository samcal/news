require 'spec_helper'

describe ArticlesController do
  describe "GET #index" do
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

    it "only loads published articles into @articles" do
      article1, article2 = create(:article), create(:article)
      article2.is_published = false
      article2.save!

      get :index
      expect(assigns(:articles)).to match_array([article1])
    end
  end

  describe "GET #show" do
    let(:article) { create(:article) }

    it "responds successfully with an HTTP 200 status code" do
      get :show, id: article.slug
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      get :show, id: article.slug
      expect(response).to render_template("show")
    end

    it "loads the article into @article" do
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

    context 'article is a draft' do
      let(:article) { create(:draft) }

      it 'redirects if user is not the owner' do
        sign_in create(:user)
        get :show, id: article.slug
        expect(response).to redirect_to(root_path)
      end
    end

    context 'article is not yet published' do
      let(:article) { create(:unpublished_article) }

      it 'redirects if the user is not logged in' do
        get :show, id: article.slug
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "GET #new" do
    context "if not authenticated" do
      it "redirects to home" do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end

    context "if authenticated" do
      before do
        sign_in create(:user)
        get :new
      end

      it "loads a new article into @article" do
        expect(assigns(:article)).to be_a_new(Article)
      end

      it "loads the new template" do
        expect(response).to render_template('new')
      end
    end
  end

  describe "POST #create" do
    context "if not authenticated" do
      it "redirects to home" do
        article = attributes_for(:article)
        post :create, :article => article
        expect(response).to redirect_to(root_path)
      end
    end

    context "if authenticated" do
      let(:category) { create(:category) }
      let(:article)  { attributes_for(:article, category_id: category.id) }

      before do
        sign_in create(:writer)
        post :create, :article => article
      end

      it "creates an article" do
        expect(Article.last.title).to eq(article[:title])
      end

      it "redirects to the article page" do
        expect(response).to redirect_to(article_path(Article.last.slug))
      end
    end
  end

  describe 'GET #edit' do
    context 'if not authenticated' do
      it 'redirects back home' do
        article = create(:article)
        get :edit, id: article.slug
        expect(response).to redirect_to(root_path)
      end
    end

    context 'if authenticated' do
      let(:user) { create(:user) }
      let(:article) { create(:article, user: user) }

      it 'allows the author to view' do
        sign_in user
        get :edit, id: article.slug
        expect(response.status).to eq(200)
      end

      it 'allows editors to view' do
        sign_in create(:editor)
        get :edit, id: article.slug
        expect(response.status).to eq(200)
      end

      it 'does not allow other writers to view' do
        sign_in create(:writer)
        get :edit, id: article.slug
        expect(response.status).to eq(302)
      end
    end
  end

  describe 'PUT #update' do
    context 'if not authenticated' do
      it 'redirects to the root path' do
        article = create(:article)
        put :update, id: article.slug, article: {}
        expect(response).to redirect_to(root_path)
      end
    end

    context 'if authenticated' do
      let(:article) { create(:article) }

      it 'allows the original author to update' do
        sign_in article.user
        new_attr = {title: 'different title'}
        put :update, id: article.slug, article: new_attr
        expect(response).to redirect_to(article_path)
        article.reload
        expect(article.title).to eq(new_attr[:title])
      end

      it 'allows an editor to update' do
        sign_in create(:editor)
        new_attr = {title: 'another different title'}
        put :update, id: article.slug, article: new_attr
        article.reload
        expect(article.title).to eq(new_attr[:title])
      end

      it 'renders the edit template if there is a mistake' do
        sign_in article.user
        put :update, id: article.slug, article: {title: ''}
        expect(response).to render_template('edit')
      end

      it 'redirects to the drafts page on save' do
        sign_in article.user
        new_attr = {text: 'A different body'}
        put :update, id: article.slug, article: new_attr, commit: 'Save Draft'
        expect(response).to redirect_to contributor_drafts_path
      end

      it 'renders a preview page if requested' do
        sign_in article.user
        new_attr = {text: 'New text for the article'}
        put :update, id: article.slug, article: new_attr, commit: 'Preview'
        expect(response).to render_template 'preview'
      end

      it 'submits the draft for review if requested' do
        sign_in article.user
        new_attr = {text: 'Text to test submission'}
        put :update, id: article.slug, article: new_attr, commit: 'Submit'
        article.reload
        expect(article.is_draft).to be false
      end

      context 'editor publishing' do
        let (:article) { create(:unpublished_article) }

        it 'allows an editor to publish article' do
          sign_in create(:editor)
          put :publish, id: article.slug
          article.reload
          expect(article.is_published).to be true
        end

        it 'does not allow anyone else to publish article' do
          sign_in article.user
          put :publish, id: article.slug
          article.reload
          expect(article.is_published).to be false
        end
      end
    end
  end
end
