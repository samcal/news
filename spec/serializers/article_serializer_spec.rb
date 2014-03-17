describe ArticleSerializer do
  it "creates special JSON for the API" do
    serializer = ArticleSerializer.new Article.new(id: 123, title: 'some title', body: 'some text')
    expect(serializer.to_json).to eql('{"post":{"id":123,"title":"some title","body":"some text"}}')
  end
end