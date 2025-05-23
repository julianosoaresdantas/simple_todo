# spec/features/user_signup_spec.rb
require 'rails_helper'

RSpec.feature "User sign up", type: :feature do
  scenario "user signs up with valid credentials" do
    visit new_user_registration_path # Go to the sign-up page

    fill_in "user_email", with: "testuser@example.com" # Use ID for email
    fill_in "user_password", with: "password"         # Use ID for password
    fill_in "user_password_confirmation", with: "password" # Use ID for password confirmation
    click_button "Sign up" # Click the sign up button

    # Verify successful sign-up
    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(User.last.email).to eq "testuser@example.com" # Check if user was created in DB
  end

  scenario "user signs up with invalid (blank) credentials" do
    visit new_user_registration_path # Go to the sign-up page

    fill_in "user_email", with: "" # Use ID for email
    fill_in "user_password", with: "" # Use ID for password
    fill_in "user_password_confirmation", with: "" # Important: Blank password confirmation too
    click_button "Sign up" # Click the sign up button

    # Verify error messages
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
    # Note: If password confirmation is blank, it doesn't usually show a separate error,
    # but just makes the password validation fail.
    expect(User.count).to eq 0 # No user should be created
  end
end
