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
      allow(subject).to receive(:authenticate_or_request_with_http_basic).with(any_args).and_return true
      get :new, params: {medium_id: movie.id}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    before do
      allow(subject).to receive(:authenticate_or_request_with_http_basic).with(any_args).and_return true
    end

    it "returns a success response" do
      review = Review.create! valid_attributes
      get :edit, params: {medium_id: movie.id, id: review.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    before do
      allow(subject).to receive(:authenticate_or_request_with_http_basic).with(any_args).and_return true
    end

    context "with valid params" do
      it "creates a new Review" do
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

    describe 'creating a second review on same media' do
      let(:valid_attributes_two) do
        { comment: 'sophisticated perspectives about nonsense media',
          stars: 4,
          medium_id: movie.id }
      end

      let(:invalid_attributes_two) do
        { comment: 'sophisticated perspectives about nonsense media',
          stars: nil,
          medium_id: movie.id }
      end

      before do
        post :create, params: {medium_id: movie.id, review: valid_attributes}, session: valid_session
      end

      context 'with valid params' do
        it 'doesn\'t change the number of reviews' do
          expect {
            post :create, params: {medium_id: movie.id, review: valid_attributes_two}, session: valid_session
          }.to change(Review, :count).by(0)
        end

        it 'deletes original review' do
          initial_review = Review.last
          expect(Review.all).to include(initial_review)

          post :create, params: {medium_id: movie.id, review: valid_attributes_two}, session: valid_session
          expect(Review.all).not_to include(initial_review)
        end
      end

      context 'with invalid params' do
        it 'doesn\'t delete original review' do
          initial_review = Review.last
          expect(Review.all).to include(initial_review)

          post :create, params: {medium_id: movie.id, review: invalid_attributes_two}, session: valid_session
          expect(Review.all).to include(initial_review)
        end

        it 'doesn\'t save new review' do
          expect {
            post :create, params: {medium_id: movie.id, review: invalid_attributes_two}, session: valid_session
          }.to change(Review, :count).by(0)
        end
      end
    end
  end

  describe "PUT #update" do
    before do
      allow(subject).to receive(:authenticate_or_request_with_http_basic).with(any_args).and_return true
    end

    context "with valid params" do
      let(:podcast) { create :podcast }
      let!(:new_attributes) {
        { comment: 'paymoneywubby',
          stars: 1,
          pick: true,
          medium_id: podcast.id }
      }

      it "updates the requested review" do
        valid_attributes
        review = Review.create! valid_attributes
        put :update, params: {medium_id: movie.id, id: review.to_param, review: new_attributes}, session: valid_session
        expect(ActionText::RichText.last.record_id).to eq(review.id)
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
    before do
      allow(subject).to receive(:authenticate_or_request_with_http_basic).with(any_args).and_return true
    end

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
