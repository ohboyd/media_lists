require 'rails_helper'

RSpec.describe "media/new", type: :view do
  before(:each) do
    assign(:medium, Medium.new(
      :title => "MyString",
      :suggested_by => "MyString",
      :rating => 1
    ))
  end

  it "renders new medium form" do
    render

    assert_select "form[action=?][method=?]", media_path, "post" do

      assert_select "input[name=?]", "medium[title]"

      assert_select "input[name=?]", "medium[suggested_by]"
    end
  end
end
