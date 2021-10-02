require 'rails_helper'

RSpec.feature 'Login user actions' do
  scenario 'Succesfull login' do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)

    visit root_path

    expect(page).to have_content("Welcome to SimpleBlogApp, #{user.email}")
  end
end
