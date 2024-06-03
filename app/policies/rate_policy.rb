class RatePolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      user.organization.rates
    end
  end

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
