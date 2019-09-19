puts 'seeding media'

if Medium.count.zero?
  10.times { FactoryBot.create :movie }
  10.times { FactoryBot.create :book }
  10.times { FactoryBot.create :show }
  10.times { FactoryBot.create :podcast }
  10.times { FactoryBot.create :music }
end

puts 'seeding reviews'
if Review.count.zero?
  1.upto(5) do |n|
    FactoryBot.create :review, created_at: Time.now.last_month, medium_id: (n * 10), pick: true
    Medium.find(n * 10).update(reviewed: true)
  end
end
