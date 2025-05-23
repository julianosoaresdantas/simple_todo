# spec/features/user_login_spec.rb
require 'rails_helper'

RSpec.feature "User login", type: :feature do
  let!(:user) { create(:user, email: "login_test@example.com", password: "password") }

  scenario "user logs in with valid credentials" do
    visit new_user_session_path # Go to the login page

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Log in"

    # Verify successful login
    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Welcome!" # Often part of the dashboard/home page for logged-in users
    # You might add other expectations here, like seeing links only available to logged-in users
  end

  scenario "user tries to log in with invalid password" do
    visit new_user_session_path # Go to the login page

    fill_in "Email", with: user.email
    fill_in "Password", with: "wrongpassword"
    click_button "Log in"

    # Verify error message
    expect(page).to have_content "Invalid Email or password."
    expect(page).not_to have_content "Signed in successfully." # Should not show success message
  end

  scenario "user tries to log in with unregistered email" do
    visit new_user_session_path # Go to the login page

    fill_in "Email", with: "unregistered@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"

    # Verify error message
    expect(page).to have_content "Invalid Email or password."
  end
end
