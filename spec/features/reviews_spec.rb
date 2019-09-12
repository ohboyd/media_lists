require 'rails_helper'

RSpec.feature "Reviews", type: :feature do
  # TODO: gotta update this once I have regular authentication in the application
  context 'create new review' do
    let(:podcast) { create :podcast }
    let!(:review) { create :review, medium_id: podcast.id }

    before do
      visit new_medium_review_path(podcast, review)
      within('form') do
        fill_in 'Comment', with: 'Oh dontcha know about this \'cast?'
        select 1, from: 'Stars'
      end
    end

    xscenario 'will be successful' do
      within('form') do
        click_button 'Create Review'
      end
      expect(page).to have_content 'Review was successfully created.'
    end

    xscenario 'will fail' do
      within('form') do
        click_button 'Create Review'
      end
      expect(page).to have_content 'Comment is too short'
    end
  end

  context 'update review' do

  end

  context 'delete review' do

  end
end
