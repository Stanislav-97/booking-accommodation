class RealtyPolicy < ApplicationPolicy

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == realties
  end

  def destroy?
    return true if user.present? && user == realties
  end

  def index?
    user.present?
  end

  def show?
    user.present?
  end

  private

    def realties
      record
    end
end