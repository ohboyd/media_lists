class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]
  before_action :set_medium, only: %i[show new edit create update destroy]

  http_basic_authenticate_with name: ENV['AUTH_USERNAME'], password: ENV['AUTH_PW'], except: %i[index show]

  def index
    @reviews = Review.picks.last_month.order('id desc').limit(5)
  end

  def show
  end

  def new
    # This deletes the previous review with the same medium_id. Regardless of whether or not it's valid. There's gotta be a better way, but I don't know what that is yet. 
    @review = @medium.build_review
  end

  def edit
  end

  def create
    @review = @medium.create_review(review_params)

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
      @medium = Medium.find(params[:medium_id]) if params.has_key?(:medium_id)
      if @medium.nil?
        flash[:error] = 'There was no defined medium! Sorry about that!'
        redirect_back(fallback_location: root_path)
      end
    end

    def review_params
      params.require(:review)
            .permit(:comment, :stars, :pick)
    end
end
