class ListPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    user_or_admin?
  end

  def destroy?
    user_or_admin?
  end

  def overview?
   user_or_admin?
  end

  private

  def user_or_admin?
    record.user == user || user.role == "admin"
  end
end
