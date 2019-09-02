require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  let(:movie) { create :movie }
  before do
    @review = assign(:review, Review.create!(comment: 'super interesting', stars: 3, medium_id: movie.id))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do
    end
  end
end
