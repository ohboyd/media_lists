require 'rails_helper'

RSpec.describe "reviews/show", type: :view do
  let(:movie) { create :movie }

  before do
    @review = assign(:review, Review.create!(comment: 'super interesting', stars: 3, medium_id: movie.id))
  end

  it "renders attributes in <p>" do
    render
  end
end
