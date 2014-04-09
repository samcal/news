class ContributorController < ApplicationController
  layout 'dashboard'
  before_action :require_login
  before_action :require_editor, :only => [:for_review, :staff]

  def drafts
    user_articles = Article.with_owner(current_user)
    @drafts = user_articles.drafts | user_articles.to_be_edited
  end

  def published
    @published = Article.with_owner(current_user).published
  end

  def for_review
    @for_review = Article.to_be_edited
  end

  def staff
    @staff = User.where(:role => :editor) | User.where(:role => :writer)
  end

  private

  def require_editor
    redirect_to root_path unless current_user.editor?
  end
end
