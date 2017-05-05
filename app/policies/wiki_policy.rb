class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @wiki = wiki
  end

  def index?
    true
  end

  def show?
    if wiki.private
      allowed
    end
    true
  end

  #   if @wiki.private
  #     (@user.premium? && @wiki.user == @user) || @user.admin? || @wiki.collaborating_users.include?(@user)
  #   else
  #     @user.standard? || @user.premium? || @user.admin?
  #   end
  # end

  def create?
    user
  end

  def new?
    user
  end

  def update?
    allowed
  end

  def edit?
    allowed
  end

  def destroy?
    allowed
  end

  def allowed
    user.premium? || user.admin? || wiki.user_id == user.id
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
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