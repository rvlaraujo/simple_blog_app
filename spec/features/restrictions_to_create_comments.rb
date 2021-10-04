require 'rails_helper'

RSpec.feature 'Restrictions to make comments' do
  scenario 'Only logged users can create comments' do
    user = FactoryBot.create(:user)
    article = Article.create!(
      title: 'Only logged users can create comments',
      body: 'Only logged users can create comments',
      user_id: user.id
    )

    visit article_path(article)

    click_link 'Adding a comment'
    expect(page).to have_current_path(new_user_session_path)
  end

  # scenario 'Users cannot comment in his Articles' do
  # end
end
