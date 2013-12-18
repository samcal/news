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
end
