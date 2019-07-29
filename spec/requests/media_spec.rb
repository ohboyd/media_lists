require 'rails_helper'

RSpec.describe "Media", type: :request do
  describe "GET /media/movies_index" do
    it "works! (now write some real specs)" do
      get movies_index_media_path
      expect(response).to have_http_status(200)
    end
  end
end
