FactoryBot.define do
  factory :user do
    email { 'admin@email.com' }
    password { '123456' }
  end

  factory :another_user do
    email { 'simpleuser@email.com' }
    password { '123456' }
  end
end
