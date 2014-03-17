require 'spec_helper'

describe Category do
  it "orders articles reverse-chronologically" do
    category = create(:category)
    article1 = create(:article, :category => category)
    article2 = create(:article, :category => category)

    expect(category.articles.order('created_at DESC')).to eq([article2, article1])
  end
end
