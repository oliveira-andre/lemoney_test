# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Offer, type: :model do
  context 'validate presence of' do
    it { should validate_presence_of(:advertiser_name) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:starts_at) }
  end

  context 'validate uniqueness of' do
    subject { build(:offer) }

    it { should validate_uniqueness_of(:advertiser_name) }
  end

  context 'validate length of' do
    it { should validate_length_of(:description).is_at_most(500) }
  end
end
