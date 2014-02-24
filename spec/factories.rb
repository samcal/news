FactoryGirl.define do
	factory :user do
		sequence(:email) { |n| "jdoe#{n}@example.com" }
		password "1234567890"
		password_confirmation { |u| u.password }

		factory :writer do
			role 'writer'
		end

		factory :editor do
			role 'editor'
		end
	end

	factory :category do
		sequence(:name) { |n| "Category#{n}" }
	end

	factory :article do
		category
		user
		sequence(:id) { |n| n }
		sequence(:title) { |n| "Article#{n}" }
		text "The Body of the Article"
		caption "The caption of the photo"
		author_name "Jon Doe"
		is_draft false
		is_published true

		factory :draft do
			is_draft true
			is_published false
		end

		factory :unpublished_article do
			is_published false
		end
	end

	factory :comment do
		article
		name "Jane Roe"
		email "jane@example.com"
		body "Commenting on the article"
	end
end