require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:article_one) { Article.create(title: 'Article One', body: 'Body one') }
  let!(:article_two) { Article.create(title: 'Article Two', body: 'Body two') }

  context 'List Articles' do
    it 'Order Articles by created_at in desc order as default' do
      expect(Article.all).to eq [article_two, article_one]
    end
  end
end
