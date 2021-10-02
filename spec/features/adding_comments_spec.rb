require 'rails_helper'

RSpec.feature 'adding reviews to Articles' do
  before do
    @john = new User(email: 'john@email.com', password: '123456')
    @fred = new User(email: 'fred@email.com', password: '123456')
    @article = Article.create!(title: 'New Article', body: 'New Body', user: @john)
  end

  scenario 'permits to sigined user to write a review' do
    login_as(@fred)

    visit articles_path

    click_link 'Show'
    fill_in 'New Comment', with: 'An amazing Article'
    click_button 'Add comment'

    expect(page).to have_content('Comment has been created.')
    expect(page).to have_content('An amazing Article')
    expect(current_path).to eq(article_path(@article.id))
  end
end
