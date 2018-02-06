class UserPolicy < ApplicationPolicy
  def show?
    user && user.admin? && super
  end

  def create?
    user
  end

  def update?
    return true if user == record
    user.admin?
  end

  def destroy?
    return false if user == record
    user.admin?
  end
end
