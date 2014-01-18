class Comment < ActiveRecord::Base
	belongs_to :article

  validates_presence_of :article
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :body
  validates_format_of :email, :with => /.+@.+\..+/i
  validates_length_of :name, :maximum => 50
  validates_length_of :body, :maximum => 2000
end
