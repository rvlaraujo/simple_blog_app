require 'rails_helper'

RSpec.feature 'Updating Articles' do
  before do
    @article = Article.create(title: 'Article', body: 'Body')
  end

  scenario 'Update an Article' do
    visit articles_path

    click_link 'Edit'

    fill_in 'Title', with: 'Update Article'
    click_button 'Update Article'

    expect(page).to have_content('Article was successfully updated.')
    expect(page).to have_current_path(article_path(@article))
  end

  scenario 'Update an Articles fails' do
    visit articles_path

    click_link 'Edit'

    fill_in 'Title', with: ''
    click_button 'Update Article'

    expect(page).to have_content('1 error prohibited this article from being saved:')
    expect(page).to have_current_path(article_path(@article))
  end
end
