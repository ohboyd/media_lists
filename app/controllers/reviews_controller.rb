class ReviewsController < ApplicationController
  def index
    @reviews = Review.picks.this_month
  end
end
