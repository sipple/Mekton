# frozen_string_literal: true

class CharacterPolicy < ApplicationPolicy
  def show?
    owner? || admin?
  end

  def update?
    owner? || admin?
  end

  def destroy?
    owner? || admin?
  end

  def create?
    user_present?
  end

  class Scope < Scope
    def resolve
      admin? ? scope.all : scope.where(user: user)
    end
  end
end
