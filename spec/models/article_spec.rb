require 'spec_helper'

describe Article do
  context "with 2 or more comments" do
    it "orders them chronologically" do
      article = Article.create!
      comment1 = article.comments.create!(:name => "Bob", :email => "bob@email.com", :body => "first comment")
      comment2 = article.comments.create!(:name => "Bob", :email => "bob@email.com", :body => "second comment")
      expect(article.reload.comments).to eq([comment1, comment2])
    end
  end
  it "shortens its long title" do
  	article1 = Article.create!(:title => "Hello")
  	article2 = Article.create!(:title => "This is a very long title and should be truncated probably by some method of the Article model class")

  	article1.short_title.should == article1.title
  	article2.short_title.should_not == article2.title
  end
end
