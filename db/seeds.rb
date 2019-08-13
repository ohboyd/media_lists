puts 'seeding media'

if Medium.count.zero?
  15.times { FactoryBot.create :movie }
  15.times { FactoryBot.create :book }
  15.times { FactoryBot.create :show }
  15.times { FactoryBot.create :podcast }
  15.times { FactoryBot.create :music }
end
