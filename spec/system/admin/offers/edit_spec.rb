# frozen_string_literal: true

require 'rails_helper'

RSpec.describe :edit_offer, type: :system do
  context 'when fill in fields with ends_at to one minute' do
    before do
      create(:offer)
    end

    it 'appear enable on the table' do
      visit "/admin/offers/#{Offer.first.id}/edit"

      within('form') do
        fill_in 'offer_ends_at', with: Time.zone.now + 1.minute
      end

      click_button('submit')

      expect(page).to have_content('enabled')
    end
  end
end
