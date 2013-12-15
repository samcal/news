class Article < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: [:slugged, :history]

	belongs_to :category
	has_many :comments

	has_attached_file :image, :styles => {:thumb => "300x230>", :medium => "600x416>"}

	def short_title
		if title.split.size <= 5
			return title
		else
			return title.split[0..4].join(' ') + '...'
		end
	end
end
