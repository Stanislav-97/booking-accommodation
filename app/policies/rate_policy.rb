class RatePolicy < ApplicationPolicy
  def create?
    user.organization_admin?
  end

  def update?
    user.organization_admin?
  end

  def index?
    true
  end
end
