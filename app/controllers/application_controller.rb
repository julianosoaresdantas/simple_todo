# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  include Pundit::Authorization # Add this line

  # Optional: Uncomment if you want to ensure every action is authorized
  # after_action :verify_authorized, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Rescue from Pundit's authorization error
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  # Helper method to skip Pundit for Devise controllers or other specific cases
  # (e.g., if you have a public home page)
  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  # Redirects unauthorized users
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end
end
