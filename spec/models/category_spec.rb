require 'spec_helper'

describe Category do
  it "orders articles reverse-chronologically" do
  	category = create(:category)
  	article1 = create(:article, :category => category)
  	article2 = create(:article, :category => category)

  	expect(category.ordered_articles).to eq([article2, article1])
  end
end
