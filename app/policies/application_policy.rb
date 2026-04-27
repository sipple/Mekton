# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  # Default: authenticated users can access. Override in subclasses
  # with owner? || admin? for user-scoped resources.
  def index?
    user_present?
  end

  def show?
    user_present?
  end

  def create?
    user_present?
  end

  def new?
    create?
  end

  def update?
    user_present?
  end

  def edit?
    update?
  end

  def destroy?
    user_present?
  end

  # Default scope: admins see all, standard users see nothing
  # (subclasses override to scope.where(user: user) for owned resources)
  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      admin? ? scope.all : scope.none
    end

    private

    attr_reader :user, :scope

    def admin?
      user&.admin?
    end
  end

  private

  def admin?
    user&.admin?
  end

  def user_present?
    user.present?
  end

  # Check if the record belongs to the current user.
  # Assumes record has a :user association. Override if different.
  def owner?
    user.present? && record.user == user
  end
end
