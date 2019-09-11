require 'rails_helper'

RSpec.feature "Media", type: :feature do
  context 'create new medium' do
    before do
      visit new_medium_path
      within('form') do
        fill_in 'Title', with: 'titley mctitleface'
        select 'Book', from: 'Media type'
      end
    end

    scenario 'will be successful' do
      within('form') do
        fill_in 'Suggested by', with: 'solja boy tell em'
        click_button 'Submit'
      end
      expect(page).to have_content 'Recommendation was successfully created.'
    end

    scenario 'will fail' do
      within('form') do
        click_button 'Submit'
      end
      expect(page).to have_content 'Suggested by can\'t be blank'
    end
  end
end
