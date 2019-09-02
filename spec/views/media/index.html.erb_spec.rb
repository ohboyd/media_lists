require 'rails_helper'

RSpec.describe "media/index", type: :view do
  before(:each) do
    assign(:media, [
      Medium.create!(
        :title => "Title",
        :suggested_by => "Suggested By",
        :rating => 2
      ),
      Medium.create!(
        :title => "Title",
        :suggested_by => "Suggested By",
        :rating => 2
      )
    ])
  end

  xit "renders a list of media" do
    #TODO: update this to be an example of a single media page out of the several options
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Suggested By".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
