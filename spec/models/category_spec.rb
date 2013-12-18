require 'spec_helper'

describe Category do
  it "orders articles reverse-chronologically" do
  	category = Category.create!
  	article1 = category.articles.create!
  	article2 = category.articles.create!

  	expect(category.ordered_articles).to eq([article2, article1])
  end
end
