require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:movie) { create :movie }
  let(:movie_two) { create :movie }
  subject { described_class.new(comment: 'super interesting', stars: 3, medium_id: movie.id)}

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a comment' do
      subject.comment = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid when stars are outside range 1..5' do
      subject.stars = 6
      expect(subject).not_to be_valid
    end
  end

  describe 'scopes' do
    let!(:review) { create :review, created_at: Time.now.last_month, medium_id: movie.id }
    let!(:picked_review) { create :picked_review, created_at: Time.now.last_month, medium_id: movie_two.id }

    context '#picks' do
      it 'returns reviews that have been chosen as picks' do
        expect(Review.picks).to include(picked_review)
      end

      it 'excludes un-picked reviews' do
        expect(Review.picks).not_to include(review)
      end
    end

    context '#last_month' do
      it 'selects reviews created within the current month' do
        expect(Review.last_month).to include(review && picked_review)
      end

      it 'excludes reviews created in other months' do
        review.created_at = Time.now - 3.months
        picked_review = Time.now - 1.year
        expect(Review.last_month).not_to include(review && picked_review)
      end
    end
  end

  describe 'methods' do
    context '#stars_as_percent' do
      it 'calculates the percentage of stars from an integer' do
        subject.stars = 4.5
        expect(subject.stars_as_percent).to eq 90.0
        subject.stars = 2.0
        expect(subject.stars_as_percent).to eq 40.0
      end
    end
  end
end
