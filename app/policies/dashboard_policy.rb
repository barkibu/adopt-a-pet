class DashboardPolicy < Struct.new(:user, :dashboard)
  def show?
    user.admin?
  end
end
