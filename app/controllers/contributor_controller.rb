class ContributorController < ApplicationController
  layout 'dashboard'
  before_action :require_login

  def drafts
    @drafts = Article.where(:user => current_user, :is_published => false)
  end

  def published
    @published = Article.where(:user => current_user, :is_published => true)
  end
end