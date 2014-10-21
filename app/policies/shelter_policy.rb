class ShelterPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user and user.admin?
  end

  def update?
    user and user.admin?
  end

  def destroy?
    user and user.admin?
  end
end
