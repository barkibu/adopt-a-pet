class ImportedPetPolicy < ApplicationPolicy
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
    user.admin?
  end
end
