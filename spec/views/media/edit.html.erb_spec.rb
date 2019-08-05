require 'rails_helper'

RSpec.describe "media/edit", type: :view do
  before(:each) do
    @medium = assign(:medium, Medium.create!(
      title: "MyString",
      suggested_by: "MyString",
      rating: 3,
      media_type: 'movie'
    ))
  end

  it "renders the edit medium form" do
    render

    assert_select "form[action=?][method=?]", medium_path(@medium), "post" do

      assert_select "input[name=?]", "medium[title]"

      assert_select "input[name=?]", "medium[suggested_by]"
    end
  end
end
