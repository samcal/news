class ArticleSerializer < ActiveModel::Serializer
  
  attributes :id, :is_published, :is_draft, :short_title

  has_one :user, embed: :id

  has_one :user, embed: :id

  has_many :comments, embed: :id, include: true

  has_many :similar_articles, embed: :ids

end
