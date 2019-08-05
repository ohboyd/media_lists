class MediaController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: ENV['AUTH_USERNAME'], password: ENV['AUTH_PW'], only: %i[edit destroy]

  def movies_index
    @media = Medium.movie_category.order(:position)
  end

  def sort
    params[:medium].each_with_index do |id, index|
      Medium.where(id: id).update_all(position: index + 1)

      head :ok
    end
  end

  def show
  end

  def new
    @medium = Medium.new
  end

  def edit
  end

  def create
    @medium = Medium.new(medium_params)

    if @medium.save
      redirect_to @medium
      flash[:success] = 'Medium was successfully created.'
    else
      render :new
    end
  end

  def update
    if @medium.update(medium_params)
      redirect_to @medium
      flash[:success] = 'Medium was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @medium.destroy
    redirect_to movies_index_media_url
    flash[:success] = 'Medium was successfully destroyed.'
  end

  private
    def set_medium
      @medium = Medium.find(params[:id])
    end

    def medium_params
      params.require(:medium)
            .permit(:title, :suggested_by, :rating, :media_type, :reason_for_suggestion, :review, :review_date, :pick,
                    :creator)
    end
end
