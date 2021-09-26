class Article < ApplicationRecord

  validates :title, :body, presence: true
  # validates :body, presence: true

end
