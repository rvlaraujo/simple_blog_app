require 'rails_helper'

RSpec.feature 'Creating articles' do
  scenario 'A user creates a new article' do
    visit '/'
    
    click_link 'New Article'
    fill_in 'Title', with: 'Creating a blog'
    fill_in 'Body', with: 'The first things first!'

    click_button 'Create Article'

    expect(page).to have_content('Article was successfully created')
    expect(page).to have_current_path(articles_path)
  end
end
