require 'rails_helper'

RSpec.feature 'Login user actions' do
  scenario 'Succesfull login' do
    user = User.create!(email: 'admin@email.com', password: '123456')
    login_as(user, scope: :user)

    visit root_path

    expect(page).to have_content("Welcome to SimpleBlogApp, #{user.email}")
  end
end
