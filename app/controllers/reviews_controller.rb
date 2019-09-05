class ReviewsController < ApplicationController
  before_action :set_review, :set_medium, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.picks.this_month
  end

  def show
  end

  def new
    @medium = Medium.find(params[:medium_id])
    @review = @medium.reviews.new
  end

  def edit
  end

  def create
    @medium = Medium.find(params[:medium_id])
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
