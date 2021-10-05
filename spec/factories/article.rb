FactoryBot.define do
  factory :article do
    title { 'An Article created by FactoryBot' }
    body { 'This is an Article created by FactoryBot' }
    user
  end
end
