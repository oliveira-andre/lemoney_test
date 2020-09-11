# frozen_string_literal: true

require 'rails_helper'

RSpec.describe :new_offer, type: :system do
  context 'when fill in fields without ends_at' do
    it 'appear enabled on the table' do
      visit '/admin/offers/new'

      within('form') do
        fill_in 'offer_advertiser_name', with: FFaker::Lorem.unique.word
        fill_in 'offer_url', with: FFaker::Internet.http_url
        fill_in 'offer_description', with: FFaker::Lorem.phrase
        fill_in 'offer_starts_at', with: Time.zone.now
      end

      click_button('submit')

      expect(page).to have_content('enabled')
    end
  end

  context 'when fill in fields with ends_at not' do
    it 'appear disabled on the table' do
      visit '/admin/offers/new'

      within('form') do
        fill_in 'offer_advertiser_name', with: FFaker::Lorem.unique.word
        fill_in 'offer_url', with: FFaker::Internet.http_url
        fill_in 'offer_description', with: FFaker::Lorem.phrase
        fill_in 'offer_starts_at', with: Time.zone.now
        fill_in 'offer_ends_at', with: Time.zone.now
      end

      click_button('submit')

      expect(page).to have_content('disabled')
    end
  end
end
