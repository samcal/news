FactoryGirl.define do
	factory :user do
		sequence(:email) { |n| "jdoe#{n}@example.com" }
		password "1234567890"
		password_confirmation { |u| u.password }
	end

	factory :category do
		sequence(:name) { |n| "Category#{n}" }
	end

	factory :article do
		category
		sequence(:id) { |n| n }
		sequence(:title) { |n| "Article#{n}" }
		text "The Body of the Article"
		caption "The caption of the photo"
		author_name "Jon Doe"
		is_draft false
		is_published true
	end

	factory :comment do
		article
		name "Jane Roe"
		email "jane@example.com"
		body "Commenting on the article"
	end
end