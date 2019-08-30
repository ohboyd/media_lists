puts 'seeding media'

if Medium.count.zero?
  15.times { FactoryBot.create :movie }
  15.times { FactoryBot.create :book }
  15.times { FactoryBot.create :show }
  15.times { FactoryBot.create :podcast }
  15.times { FactoryBot.create :music }
end

puts 'seeding reviews'
movie = Medium.find(1)

if Review.count.zero?
  1.upto(10) do
    FactoryBot.create :review
    # Review.create!(stars:4, comment: Faker::Hipster.paragraph, medium_id: (n * 10))
  end
end
