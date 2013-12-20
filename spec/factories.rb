FactoryGirl.define do
	factory :category do
		sequence(:name) { |n| "Category#{n}" }
	end

	factory :article do
		category
		sequence(:id) { |n| n }
		sequence(:title) { |n| "Article#{n}" }
		text "The Body of the Article"
		author_name "Jon Doe"
	end

	factory :comment do
		article
		name "Jane Roe"
		email "jane@example.com"
		body "Commenting on the article"
	end
end