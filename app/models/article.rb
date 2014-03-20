class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  belongs_to :user
  belongs_to :category
  has_many :comments

  has_attached_file :image, :styles => {:thumb => "300x230#", :medium => "600x416#"}

  validates_presence_of :category
  validates_presence_of :title
  validates_presence_of :text
  validates_presence_of :author_name
  
  scope :published, -> { where(is_published: true) }
  scope :to_be_edited, -> { where(is_draft: false, is_published: false) }
  scope :drafts, -> { where(is_draft: true) }
  scope :owner, -> (owner) { where(user_id: owner.id) }

  self.per_page = 12

  def short_title
    max_length = 45    # Maximum length in characters
    if title.length <= max_length
      return title
    else
      return title[0..max_length-1].split(' ')[0..-2].join(' ') + '...'
    end
  end

  def similar_articles
    a_ids = category.article_ids
    a_ids.delete(id)
    Article.where(:id => a_ids.sort_by { rand }.slice(0, 3))
  end
end
