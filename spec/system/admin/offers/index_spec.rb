# frozen_string_literal: true

require 'rails_helper'

RSpec.describe :new_offer, type: :system do
  context 'when click on disable link' do
    before do
      create(:offer)
    end

    it 'appear disabled on the table' do
      visit '/admin/offers'
      click_link '[disable]'
      expect(page).to have_content('disabled')
    end
  end

  context 'when click on enable link' do
    before do
      create(:offer_disabled)
    end

    it 'appear enabled on the table' do
      visit '/admin/offers'
      click_link '[enable]'
      expect(page).to have_content('enabled')
    end
  end

  context 'when click on destroy link' do
    before do
      create(:offer)
    end

    it 'table appear empty' do
      visit '/admin/offers'
      click_link '[destroy]'
      expect(page).to_not have_link('[edit]')
    end
  end

  context 'when click on new link' do
    it 'appear submit buttton' do
      visit '/admin/offers'
      click_link 'new offer'
      expect(page).to have_button('submit')
    end
  end

  context 'when click on new link' do
    before do
      create(:offer)
    end

    it 'appear submit buttton' do
      visit '/admin/offers'
      click_link 'new offer'
      expect(page).to have_button('submit')
    end
  end
end
