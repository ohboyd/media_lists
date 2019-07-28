require 'rails_helper'

RSpec.describe "media/edit", type: :view do
  before(:each) do
    @movie = assign(:movie, Medium.create!(
      :title => "MyString",
      :suggested_by => "MyString",
      :rating => 1
    ))
  end

  it "renders the edit movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do

      assert_select "input[name=?]", "movie[title]"

      assert_select "input[name=?]", "movie[suggested_by]"

      assert_select "input[name=?]", "movie[rating]"
    end
  end
end
