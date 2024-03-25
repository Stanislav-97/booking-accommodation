class BookingPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.organization_admin?
        user.organization.bookings
      else
        user.bookings
      end
    end
  end

  def create?
    user.organization_admin?
  end

  def update?
    user.organization_admin?
  end

  def destroy?
    user.organization_admin?
  end

  def index?
    true
  end
end