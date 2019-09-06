class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]
  before_action :set_medium, only: %i[show new edit create update destroy]

  def index
    @reviews = Review.picks.this_month
  end

  def show
  end

  def new
    @review = @medium.reviews.new
  end

  def edit
  end

  def create
    @review = @medium.reviews.new(review_params)

    if @review.save
      redirect_to medium_review_url(@medium, @review)
      flash[:success] = 'Review was successfully created.'
    else
      render :new
    end
  end

  def update
    if @review.update(review_params)
      redirect_to medium_review_url(@medium, @review)
      flash[:success] = 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to @medium
    flash[:success] = 'Review was successfully destroyed.'
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_medium
      @medium = Medium.find(params[:medium_id])
    end

    def review_params
      params.require(:review)
            .permit(:comment, :stars, :pick)
    end
end
