class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki
  
  def initialize(user, wiki)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @wiki = wiki
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user
  end

  def new?
    create?
  end

  def update?
    # user.admin || wiki.user_id == user.id
    user.admin? || (wiki.user == user)
  end

  def edit?
    user.admin? || (wiki.user == user)
  end
  
  def destroy?
    user.admin? || (wiki.user == user)
    # user.admin? || wiki.user_id == user.id

  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
  
  class Scope < Scope
    attr_reader :user, :scope
    
    def initialize(user, scope)
      @user = user
      @scope = scope
    end
    
    def resolve
      scope
    end
  end
end
