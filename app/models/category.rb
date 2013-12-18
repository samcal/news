class Category < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged

	has_many :articles

	def ordered_articles
		articles.reverse
	end
end
