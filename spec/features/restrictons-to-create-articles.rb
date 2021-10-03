require 'rails_helper'

RSpec.feature 'Only signin users can create articles' do
  scenario 'Not login user' do
    visit root_path

    click_link 'New Article'

    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'User logged in' do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)

    visit root_path
    click_link 'New Article'

    expect(page).to have_current_path(new_article_path)
  end
end
