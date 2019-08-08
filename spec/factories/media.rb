FactoryBot.define do
  factory :medium do

    factory :movie do
      title { Faker::Book.title }
      suggested_by { Faker::GreekPhilosophers.name }
      media_type { 'movie' }
      reason_for_suggestion { Faker::TvShows::SiliconValley.motto }
    end

    factory :book do
      title { Faker::Book.title }
      suggested_by { Faker::Book.author }
      media_type { 'book' }
      reason_for_suggestion { Faker::Quote.famous_last_words }
    end

    factory :show do
      title { Faker::TvShows::BreakingBad.episode }
      suggested_by { Faker::TvShows::RickAndMorty.character }
      media_type { 'show' }
      reason_for_suggestion { Faker::TvShows::RickAndMorty.quote }
    end

    factory :podcast do
      title { Faker::Hipster.sentence(word_count: 3) }
      suggested_by { Faker::Science.scientist }
      media_type { 'podcast' }
      reason_for_suggestion { Faker::TvShows::BojackHorseman.tongue_twister }
    end
  end
end
