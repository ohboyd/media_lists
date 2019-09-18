FactoryBot.define do
  factory :medium do

    factory :movie do
      title { Faker::Book.title }
      suggested_by { Faker::GreekPhilosophers.name }
      media_type { 'movie' }
      suggestion_reason { Faker::TvShows::SiliconValley.motto }
    end

    factory :book do
      title { Faker::Book.title }
      suggested_by { Faker::Book.author }
      media_type { 'book' }
      suggestion_reason { Faker::Quote.famous_last_words }
    end

    factory :show do
      title { Faker::TvShows::BreakingBad.episode }
      suggested_by { Faker::TvShows::RickAndMorty.character }
      media_type { 'show' }
      suggestion_reason { Faker::TvShows::RickAndMorty.quote }
    end

    factory :podcast do
      title { Faker::Hipster.sentence(word_count: 3) }
      suggested_by { Faker::Science.scientist }
      media_type { 'podcast' }
      suggestion_reason { Faker::TvShows::BojackHorseman.tongue_twister }
    end

    factory :music do
      title { Faker::Music.band }
      suggested_by { Faker::Music::RockBand.name }
      media_type { 'music' }
      suggestion_reason { Faker::Quote.yoda }
    end
  end
end
