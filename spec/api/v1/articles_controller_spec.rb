require 'spec_helper'

describe API::V1::ArticlesController do
  describe "GET index" do
    it "responds successfully with an HTTP 200 status code" do
      get api_v1_articles_path
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      article = create(:article)
      get api_v1_articles_path, id: article.id
      expect(response).to be_success
      expect(response.status).to eq(200)
      # expect(response.body).to eq(render json: article)
    end
  end
end