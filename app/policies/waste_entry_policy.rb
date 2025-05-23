# app/policies/waste_entry_policy.rb
class WasteEntryPolicy < ApplicationPolicy
  # Everyone can see the list of waste entries (though we'll limit it to their own later)
  def index?
    true
  end

  # A user can view a waste entry if it belongs to them
  def show?
    record.user == user
  end

  # A user can create a new waste entry if they are logged in
  def create?
    user.present?
  end

  # A user can update a waste entry if it belongs to them
  def update?
    record.user == user
  end

  # A user can delete a waste entry if it belongs to them
  def destroy?
    record.user == user
  end

  # If you uncommented verify_policy_scoped in ApplicationController, you'd need this
  # class Scope < Scope
  #   def resolve
  #     # Users can only see their own waste entries
  #     scope.where(user: user)
  #   end
  # end
end
