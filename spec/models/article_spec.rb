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
end
