class PetPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user && !user.user?
  end

  def update?
    return false unless user
    (user == record.user) || user.admin?
  end

  def destroy?
    user && user.admin?
  end

  def adopt?
    true
  end
end
