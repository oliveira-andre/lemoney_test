# frozen_string_literal: true

module Admin
  # resource conroller offers
  class OffersController < ApplicationController
    before_action :load_offers

    def index; end

    private

    def load_offers
      @offers = Offer.all
    end
  end
end
