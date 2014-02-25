class ContributorController < ApplicationController
  layout 'dashboard'
  before_action :require_login

  def drafts
    @drafts = Article.where(:user => current_user, :is_published => false)
  end

  def published
    @published = Article.where(:user => current_user, :is_published => true)
  end

  def for_review
    redirect_to root_path unless current_user.editor?
    @for_review = Article.where(:is_draft => false, :is_published => false)
  end
end