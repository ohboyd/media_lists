require 'rails_helper'

RSpec.describe "media/show", type: :view do
  before(:each) do
    @medium = assign(:medium, Medium.create!(
      title: "MyString",
      suggested_by: "MyString",
      rating: 3,
      media_type: 'movie'
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Suggested by/)
    expect(rendered).to match(/3/)
  end
end
