require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let(:movie) { create :movie }

  # This should return the minimal set of attributes required to create a valid
  # Review. As you add validations to Review, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { comment: 'foobity doobity',
      stars: 4,
      pick: true,
      medium_id: movie.id }
  end

  let(:invalid_attributes) do
    { comment: nil,
      stars: 99,
      media_type: nil }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ReviewsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Review.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      review = Review.create! valid_attributes
      get :show, params: {medium_id: movie.id, id: review.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {medium_id: movie.id}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      review = Review.create! valid_attributes
      get :edit, params: {medium_id: movie.id, id: review.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Review" do
        #TODO: had to add the medium_id to the strong params on the Reviews controller, and that seems strange for this. See if it's possible to figure out the reason that this was necessary, and see if there's a better solution.

        expect {
          post :create, params: {medium_id: movie.id, review: valid_attributes}, session: valid_session
        }.to change(Review, :count).by(1)
      end

      it "redirects to the created review" do
        post :create, params: {medium_id: movie.id, review: valid_attributes}, session: valid_session
        expect(response).to redirect_to(medium_review_url(movie, Review.last))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {medium_id: movie.id, review: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:podcast) { create :podcast }
      let(:new_attributes) {
        { comment: 'paymoneywubby',
          stars: 1,
          pick: true,
          medium_id: podcast.id }
      }

      it "updates the requested review" do
        review = Review.create! valid_attributes
        put :update, params: {medium_id: movie.id, id: review.to_param, review: new_attributes}, session: valid_session
        review.reload
        expect(review.comment).to eq('paymoneywubby')
      end

      it "redirects to the review" do
        review = Review.create! valid_attributes
        put :update, params: {medium_id: movie.id, id: review.to_param, review: valid_attributes}, session: valid_session
        expect(response).to redirect_to(medium_review_url(movie, review))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        review = Review.create! valid_attributes
        put :update, params: {medium_id: movie.id, id: review.to_param, review: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested review" do
      review = Review.create! valid_attributes
      expect {
        delete :destroy, params: {medium_id: movie.id, id: review.to_param}, session: valid_session
      }.to change(Review, :count).by(-1)
    end

    it "redirects to the reviews list" do
      review = Review.create! valid_attributes
      delete :destroy, params: {medium_id: movie.id, id: review.to_param}, session: valid_session
      expect(response).to redirect_to(movie)
    end
  end

end
