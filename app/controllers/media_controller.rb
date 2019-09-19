class MediaController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :destroy]

  http_basic_authenticate_with name: ENV['AUTH_USERNAME'], password: ENV['AUTH_PW'], only: %i[edit destroy]

  def index
    @media = Medium.reviewed.order(:position)
  end

  def movies_index
    @media = Medium.movie_category.unreviewed.order(:position)
  end

  def books_index
    @media = Medium.book_category.unreviewed.order(:position)
  end

  def shows_index
    @media = Medium.show_category.unreviewed.order(:position)
  end

  def podcasts_index
    @media = Medium.podcast_category.unreviewed.order(:position)
  end

  def music_index
    @media = Medium.music_category.unreviewed.order(:position)
  end

  def show
  end

  def new
    @medium = Medium.new(media_type: media_type_origin)
  end

  def edit
  end

  def create
    @medium = Medium.new(medium_params)

    if @medium.save
      redirect_to @medium
      flash[:success] = 'Recommendation was successfully created.'
    else
      render :new
    end
  end

  def update
    if @medium.update(medium_params)
      redirect_to @medium
      flash[:success] = 'Recommendation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @medium.destroy
    # TODO: change this to use the media_type_origin method below to dynamically return to the proper index
    redirect_to movies_index_media_url
    flash[:success] = 'Recommendation was successfully destroyed.'
  end

  def sort
    params[:medium].each_with_index do |id, index|
      Medium.where(id: id).update_all(position: index + 1)

      head :ok
    end
  end

  private
    def set_medium
      @medium = Medium.find(params[:id])
    end

    def medium_params
      params.require(:medium)
            .permit(:title, :suggested_by, :rating, :media_type, :suggestion_reason, :link, :reviewed)
    end

    def media_type_origin
      return unless request.env["HTTP_REFERER"]
      case URI(request.referer).path
      when '/media/movies_index'
       'movie'
      when '/media/books_index'
       'book'
      when '/media/shows_index'
       'show'
      when '/media/podcasts_index'
       'podcast'
      when '/media/music_index'
       'music'
     end
    end
end
