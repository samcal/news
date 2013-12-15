class AddArticleToComments < ActiveRecord::Migration
  def change
    add_column :comments, :article_id, :integer
    add_index :comments, :article_id
  end
end
