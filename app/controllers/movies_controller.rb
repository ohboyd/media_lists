class MediaController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @media = Medium.order(:position)
  end

  def sort
    params[:movie].each_with_index do |id, index|
      Medium.where(id: id).update_all(position: index + 1)

      head :ok
    end
  end

  def show
  end

  def new
    @movie = Medium.new
  end

  def edit
  end

  def create
    @movie = Medium.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Medium was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Medium was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to media_url, notice: 'Medium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_movie
      @movie = Medium.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :suggested_by, :rating)
    end
end
