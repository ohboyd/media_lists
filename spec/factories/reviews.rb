FactoryBot.define do
  factory :review do
    comment { Faker::Hipster.paragraph }
    stars { rand(1..5) }
    pick { true }
    association :medium, factory: :movie
  end
end
