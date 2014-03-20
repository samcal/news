require 'spec_helper'

describe API::V1::ArticlesController, :type => :controller do
  describe "GET #index" do
    before do
      15.times do
        create(:article)
      end
    end

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it 'paginates when asked to' do
      get :index, :page => 1
      expect(assigns(:articles).length).to eq(12)
    end

    it 'returns all articles by default' do
      get :index
      expect(assigns(:articles).length).to eq(15)
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      article = create(:article)
      get :show, id: article.id
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end
