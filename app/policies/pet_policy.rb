class PetPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user
  end

  def update?
    return false unless user
    (user == record.user) or user.admin?
  end

  alias_method :destroy?, :update?

  def adopt?
    true
  end
end
