require 'rails_helper'

RSpec.describe MediaController, type: :controller do

  let(:valid_attributes) do
    { title: 'Batman',
      suggested_by: 'Bruce',
      media_type: 'movie' }
  end

  let(:invalid_attributes) {
    { title: nil,
      suggested_by: nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MediaController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Medium.create! valid_attributes
      get :movies_index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      medium = Medium.create! valid_attributes
      get :show, params: { id: medium.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      allow(subject).to receive(:authenticate_or_request_with_http_basic).with(any_args).and_return true
      medium = Medium.create! valid_attributes
      get :edit, params: { id: medium.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Medium" do
        expect {
          post :create, params: { medium: valid_attributes }, session: valid_session
        }.to change(Medium, :count).by(1)
      end

      it "redirects to the created medium" do
        post :create, params: { medium: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Medium.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { medium: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        { title: 'BraaaapMan',
          suggested_by: 'Fuego Manchego' }
      end

      it "updates the requested medium" do
        medium = Medium.create! valid_attributes
        put :update, params: { id: medium.to_param, medium: new_attributes} , session: valid_session
        medium.reload
        expect(medium.suggested_by).to eq('Fuego Manchego')
      end

      it "redirects to the medium" do
        medium = Medium.create! valid_attributes
        put :update, params: { id: medium.to_param, medium: valid_attributes }, session: valid_session
        expect(response).to redirect_to(medium)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        medium = Medium.create! valid_attributes
        put :update, params: { id: medium.to_param, medium: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested medium" do
      medium = Medium.create! valid_attributes
      allow(subject).to receive(:authenticate_or_request_with_http_basic).with(any_args).and_return true
      expect {
        delete :destroy, params: { id: medium.to_param }, session: valid_session
      }.to change(Medium, :count).by(-1)
    end

    it "redirects to the media list" do
      medium = Medium.create! valid_attributes
      allow(subject).to receive(:authenticate_or_request_with_http_basic).with(any_args).and_return true
      delete :destroy, params: { id: medium.to_param }, session: valid_session
      expect(response).to redirect_to(movies_index_media_url)
    end
  end
end
