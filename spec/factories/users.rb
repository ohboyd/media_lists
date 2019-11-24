FactoryBot.define do
  factory :user do
    name { 'Admin User'}
    email { 'admin@example.com' }
    password { 'password' }
  end
end
