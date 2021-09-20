# frozen_string_literal: true

class PostCommentPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    record.user_id == user.id
  end

  def edit?
    update?
  end

  def destroy?
    record.user_id == user.id
  end
end
