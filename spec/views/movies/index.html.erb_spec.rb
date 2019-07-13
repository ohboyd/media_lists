require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  before(:each) do
    assign(:movies, [
      Movie.create!(
        :title => "Title",
        :suggested_by => "Suggested By",
        :rating => 2
      ),
      Movie.create!(
        :title => "Title",
        :suggested_by => "Suggested By",
        :rating => 2
      )
    ])
  end

  xit "renders a list of movies" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Suggested By".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
