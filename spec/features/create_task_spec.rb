# spec/features/create_task_spec.rb
require 'rails_helper'

RSpec.feature "Creating a Task", type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  scenario "User creates a new task successfully" do
    visit new_task_path

    expect(page).to have_current_path(new_task_path)
    expect(page).to have_selector('form[action="/tasks"]')

    # --- ADD THIS LINE HERE ---
    # --- END ADDITION ---

    fill_in "task_title", with: "My New Task"
    fill_in "Description", with: "This is a detailed description of my new task."
    select "pending", from: "Status"

    click_button "Create Task"

    expect(page).to have_content "Task was successfully created."
    expect(page).to have_content "My New Task"
    expect(page).to have_content "This is a detailed description of my new task."

    created_task = Task.last
    expect(created_task.title).to eq "My New Task"
    expect(created_task.description).to eq "This is a detailed description of my new task."
    expect(created_task.completed).to be_falsey
    expect(created_task.status).to eq "pending"
    expect(created_task.user).to eq user
  end

  scenario "User attempts to create a task with invalid data" do
    visit new_task_path

    expect(page).to have_current_path(new_task_path)
    expect(page).to have_selector('form[action="/tasks"]')

    fill_in "task_title", with: ""
    fill_in "Description", with: "Some description"
    select "pending", from: "Status"

    click_button "Create Task"

    expect(page).to have_content "Title can't be blank"
    expect(Task.count).to eq 0
  end
end
