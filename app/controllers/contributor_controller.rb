class ContributorController < ApplicationController
  layout 'dashboard'
  before_action :require_login
  before_action :require_editor, :only => [:for_review, :staff]

  def drafts
    @drafts = Article.where(:user => current_user, :is_published => false)
  end

  def published
    @published = Article.where(:user => current_user, :is_published => true)
  end

  def for_review
    @for_review = Article.where(:is_draft => false, :is_published => false)
  end

  def staff
    @staff = User.all
  end

  private

  def require_editor
    redirect_to root_path unless current_user.editor?
  end
end
