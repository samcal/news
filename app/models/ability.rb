class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new     # Guest user if not logged in
    if user.editor?
      can :manage, :all
      cannot :update, Comment
    elsif user.writer?
      can :read, :all
      can :create, Article
      can :update, Article, :is_draft => true, :user => user
    else
      can :read, :all
      cannot :read, Article, :is_published => false
    end
  end
end
