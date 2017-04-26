class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki
  
  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end
  
  def destroy?
    user.admin? || (wiki.user == user)
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


# class WikiPolicy < ApplicationPolicy

#   def update?
#     user.present?
#   end

#   def new?
#     user.present?
#   end

#   def create?
#     user.present?
#   end

#   def show?
#     user.present?
#   end

#   def edit?
#     user.present?
#   end

# end