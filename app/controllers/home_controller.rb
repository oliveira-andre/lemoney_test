# frozen_string_literal: true

# main page controller
class HomeController < ApplicationController
  before_action :load_offers

  def index; end

  private

  def load_offers
    @offers = Offer.actives
  end
end
