class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :articles

  validates_presence_of :name
end
