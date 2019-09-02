require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  let(:movie) { create :movie }
  before do
    assign(:review, Review.new(comment: 'super interesting', stars: 3, medium_id: movie.id))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do
    end
  end
end
