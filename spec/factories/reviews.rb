FactoryBot.define do
  factory :review do
    comment { Faker::Hipster.paragraph }
    stars { rand(1..5) }
    association :medium, factory: :movie
    # should be able to just use movie without association :medium, factory: :movie. Need to make sure that works with seeding and rspec tests before making the transition permanent.

    factory :picked_review do
      pick { true }
    end
  end
end
