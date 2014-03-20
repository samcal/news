News::Application.routes.draw do
  devise_for :users
  root 'articles#index'

  resources :comments
  resources :articles
  resources :categories

  namespace :contributor do
    get :drafts
    get :published
    get :for_review
    get :staff
  end

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :articles
      resources :categories
    end
  end
end
