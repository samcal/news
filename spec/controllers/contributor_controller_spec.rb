require 'spec_helper'

describe ContributorController do
  describe 'GET #drafts' do
    context 'if authenticated' do
      let(:user) { create(:user) }

      before do
        sign_in user
      end

      it 'only assigns articles writted by the current user to @drafts' do
        other_user = create(:user)

        article1 = create(:draft, user: user)
        article2 = create(:draft, user: other_user)

        get :drafts
        expect(assigns(:drafts)).to match_array([article1])
      end

      it 'only assigns unpublished articles to @drafts' do
        article1 = create(:draft, user: user)
        article2 = create(:unpublished_article, user:user)
        article3 = create(:article, user:user)

        get :drafts
        expect(assigns(:drafts)).to match_array([article1, article2])
      end
    end

    context 'if not authenticated' do
      it 'redirects to root_path' do
        get :drafts
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET #published' do
    context 'if authenticated' do
      let(:user) { create(:user) }

      before do
        sign_in user
      end

      it 'only loads articles written by the current user' do
        other_user = create(:user)

        article1 = create(:article, user: user)
        article2 = create(:article, user: other_user)

        get :published
        expect(assigns(:published)).to match_array([article1])
      end

      it 'only loads published articles' do
        article1 = create(:article, user: user)
        article2 = create(:unpublished_article, user: user)

        get :published
        expect(assigns(:published)).to match_array([article1])
      end
    end

    context 'if not authenticated' do
      it 'redirects to the root path' do
        get :published
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET #for_review' do
    context 'if authenticated' do
      it 'allows editor to access' do
        sign_in create(:editor)
        get :for_review
        expect(response.status).to eq(200)
      end

      it 'redirects anyone else' do
        sign_in create(:writer)
        get :for_review
        expect(response).to redirect_to(root_path)
      end

      it 'loads the right articles into @for_review' do
        sign_in create(:editor)
        article1 = create(:draft)
        article2 = create(:unpublished_article)
        article3 = create(:article)
        get :for_review
        expect(assigns(:for_review)).to match_array([article2])
      end
    end

    context 'if not authenticated' do
      it 'redirects to root path' do
        get :for_review
        expect(response).to redirect_to(root_path)
      end
    end
  end
end