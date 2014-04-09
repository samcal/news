require 'spec_helper'

describe Article do
  context "with 2 or more comments" do
    it "orders them chronologically" do
      article = create(:article)
      comment1 = create(:comment, :article => article)
      comment2 = create(:comment, :article => article)
      expect(article.reload.comments).to eq([comment1, comment2])
    end
  end

  it "shortens its long title" do
    article1 = create(:article, :title => "Hello")
    article2 = create(:article, :title => "This is a very long title and should be truncated probably by some method of the Article model class")

    expect(article1.short_title).to eq(article1.title)
    expect(article2.short_title).to_not eq(article2.title)
  end

  describe "Article#keywords" do
    it "only returns an array of three keywords with correct format" do
      article = create(:article, :title => "-", :text => "one one two two two three three three four four four four")
      expect(article.keywords.length).to eq(3)
      expect(article.keywords.first.length).to eq(2)
    end

    it "removes articles of speech" do
      article = create(:article, :title => "-", :text => "a a and and an an the the one two three")
      expect(article.keywords).to eq([["one", 1], ["two", 1], ["three", 1]])
    end

    it "orders sequential when tied" do
      article = create(:article, :title => "-", :text => "one one two two three three")
      expect(article.keywords).to eq([["one", 2], ["two", 2], ["three", 2]])
    end

    it "disregards case" do
      article1 = create(:article, :title => "-", :text => "ONE TWO TWO THREE THREE THREE")
      article2 = create(:article, :title => "-", :text => "one two two three Three THREE")
      expect(article1.keywords).to eq(article2.keywords)
    end

    it "notices words in title" do
      article = create(:article, :title => "three three three", :text => "two two one")
      expect(article.keywords.first.first).to eq("three")
    end

    it "counts words of title twice" do
      article = create(:article, :title => "double double", :text => "three three three, two two, one")
      expect(article.keywords).to eq([["double", 4], ["three", 3], ["two", 2]])
    end

    it "orders title sequential when tied" do
      article = create(:article, :title => "title", :text => "body body text")
      expect(article.keywords).to eq([["title", 2], ["body", 2], ["text", 1]])
    end
  end
end
