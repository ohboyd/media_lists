FactoryBot.define do
  factory :review do
    comment { Faker::Hipster.paragraph }
    stars { rand(5) }
    association :medium, factory: :medium
  end
end
