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

  scenario 'A user fails to create a new Article' do
    visit root_path

    click_link 'New Article'
    fill_in 'Title', with: ''
    fill_in 'Body', with: ''

    click_button 'Create Article'

    expect(page).to have_content('errors prohibited this article from being saved')
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
    expect(page).to have_current_path(articles_path)
  end

  scenario 'A user has no articles to show' do
    Article.delete_all
    visit articles_path
    expect(page).to have_content("There's not Articles to show")
  end
end
