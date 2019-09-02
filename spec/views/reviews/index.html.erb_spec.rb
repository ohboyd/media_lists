require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  let(:movie) { create :movie }
  let(:movie_two) { create :movie }
  before do
    assign(:reviews, [
      Review.create!(comment: 'super interesting', stars: 3, medium_id: movie.id),
      Review.create!(comment: 'the most interesting', stars: 1, medium_id: movie_two.id)
    ])
  end

  it "renders a list of reviews" do
    render
    #TODO: include this after adding capybara
    # expect(page).to include(reviews)
  end
end
