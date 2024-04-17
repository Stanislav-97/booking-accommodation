class RealtyPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.organization_admin?
        user.organization.realties
      else
        user.realties
      end
    end
  end

  def create?
    user.organization_admin?
  end

  def update?
    user.organization_admin? || user.realty_ids.include?(record.id)
  end

  def destroy?
    user.organization_admin? || user.realty_ids.include?(record.id)
  end

  def index?
    true
  end

  def show?
    user.organization_admin? || user.realty_ids.include?(record.id)
  end
end
