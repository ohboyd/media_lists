require 'rails_helper'

RSpec.describe "Media", type: :request do
  let(:movie) { Medium.create!(title: 'foo', suggested_by: 'bar', media_type: 'movie') }
  let(:book) { Medium.create!(title: 'foo', suggested_by: 'bar', media_type: 'book') }

  describe "GET /media/movies_index" do
    it 'returns a valid status' do
      movie
      get movies_index_media_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /media/movies_index" do
    it 'returns a valid status' do
      book
      get books_index_media_path
      expect(response).to have_http_status(200)
    end
  end
end
