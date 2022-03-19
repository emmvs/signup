class SignPolicy < ApplicationPolicy
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

  def edit?
    user_or_admin?
  end

  def update?
    user_or_admin?
  end

  def destroy?
    user_or_admin?
  end

  def requests?
    true
  end

  def overview?
    true
  end

  private

  def user_or_admin?
    record.user == user || user.admin
  end
end
