# frozen_string_literal: true

require 'rails_helper'

RSpec.describe :home_page, type: :system do
  context 'when have offer actives' do
    before do
      create(:offer)
    end

    it 'appear offers' do
      visit '/'
      expect(page).to have_content('Shop Now')
    end
  end

  context 'when have offer premium' do
    before do
      create(:offer_premium)
    end

    it 'appear offer' do
      visit '/'
      expect(page).to have_content('Premium')
    end
  end

  context 'when have offer disabled' do
    before do
      create(:offer_disabled)
    end

    it 'not appear offer' do
      visit '/'
      expect(page).to_not have_content('Shop Now')
    end
  end
end
