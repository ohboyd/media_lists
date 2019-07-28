require 'rails_helper'

RSpec.describe "media/new", type: :view do
  before(:each) do
    assign(:movie, Medium.new(
      :title => "MyString",
      :suggested_by => "MyString",
      :rating => 1
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", media_path, "post" do

      assert_select "input[name=?]", "movie[title]"

      assert_select "input[name=?]", "movie[suggested_by]"

      assert_select "input[name=?]", "movie[rating]"
    end
  end
end
