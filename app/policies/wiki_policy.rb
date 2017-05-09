class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @wiki = wiki
  end

  # def index?
  #   true
  # end

  def show?
    if wiki.private
      allowed
    end
    true
  end

  def create?
    user
  end

  def new?
    user
  end

  def update?
    allowed
    # @user.present?
  end

  def edit?
    allowed
  end

  def destroy?
    allowed
  end

  def allowed
    user.premium? || user.admin? || wiki.user_id == user.id || @wiki.collaborating_users.include?(@user)
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
      wikis = []
      all_wikis = scope.all.order("created_at DESC")
      if user.role == 'admin'
        wikis = all_wikis # if the user is an admin, show them all the wikis
      elsif user.role == 'premium'
        all_wikis.each do |wiki|
          if wiki.public? || wiki.user == @user || wiki.collaborating_users.include?(@user)
            wikis << wiki # if the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaborator on
          end
        end
      else # this is the lowly standard user
        all_wikis.each do |wiki|
          if wiki.public? || wiki.collaborating_users.include?(@user)
            wikis << wiki # only show standard users public wikis and private wikis they are a collaborator on
          end
        end
      end
      wikis # return the wikis array we've built up
    end
  end
end