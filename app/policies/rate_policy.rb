class RatePolicy < ApplicationPolicy
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
    user.organization_admin?
  end

  def index?
    true
  end
  #тут можешь пожалуйста напомнить, касался этого 1 раз и в самом начале) 
  # 1 - мы говорим в эндпоинтах кому какое действие разрешено, 
  # 2 - в scope мы разрешаем конкретному пользователю конкретное действие
end