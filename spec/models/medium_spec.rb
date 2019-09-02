require 'rails_helper'

RSpec.describe Medium, type: :model do
  subject { described_class.new(title: 'foo', suggested_by: 'bar', media_type: 'podcast') }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a suggestor' do
    subject.suggested_by = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a media type' do
    subject.media_type = nil
    expect(subject).to_not be_valid
  end
end
