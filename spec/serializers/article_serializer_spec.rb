describe ArticleSerializer do
  let(:result_hash) { JSON.parse(ArticleSerializer.new(create(:article)).to_json) }

  it "creates special JSON for the API" do
    expect(result_hash).to have_key('article')
  end
end
