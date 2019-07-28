class MediaController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :destroy]

  def index
    @media = Medium.order(:position)
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

    respond_to do |format|
      if @medium.save
        format.html { redirect_to @medium, notice: 'Medium was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @medium.update(medium_params)
        format.html { redirect_to @medium, notice: 'Medium was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @medium.destroy
    respond_to do |format|
      format.html { redirect_to media_url, notice: 'Medium was successfully destroyed.' }
    end
  end

  private
    def set_medium
      @medium = Medium.find(params[:id])
    end

    def medium_params
      params.require(:medium).permit(:title, :suggested_by, :rating)
    end
end
