require 'rails_helper'

RSpec.feature 'Restrictions to make comments' do
  before do
    @user = FactoryBot.create(:user)
    @article = FactoryBot.create(:article, user_id: @user.id)
  end

  scenario 'Only logged users can create comments' do
    visit article_path(@article)

    click_link 'Adding a comment'
    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'Users cannot comment in his Articles' do
    login_as(@user, scope: :user)

    visit article_path(@article)

    click_link 'Adding a comment'
    expect(page).to have_content('You cannot add comments for your Article')
  end
end
