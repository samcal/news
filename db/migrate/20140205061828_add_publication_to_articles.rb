class AddPublicationToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :is_draft, :boolean, :default => true
    add_column :articles, :is_published, :boolean, :default => false
  end
end
