class PetPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.shelter? or user.admin?
  end

  def update?
    user.shelter? or user.admin?
  end

  def destroy?
    user.admin?
  end
end
