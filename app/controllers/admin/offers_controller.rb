# frozen_string_literal: true

module Admin
  # resource conroller offers
  class OffersController < ApplicationController
    before_action :load_offers, only: :index
    before_action :load_offer, except: :index

    def index; end

    def new; end

    private

    def load_offers
      @offers = Offer.all
    end

    def load_offer
      @offer = params[:id] ? Offer.find(params[:id]) : Offer.new
    end
  end
end
