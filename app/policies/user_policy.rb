class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin? and super
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    return false if user == record
    user.admin?
  end
end
