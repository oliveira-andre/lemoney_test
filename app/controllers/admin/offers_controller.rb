# frozen_string_literal: true

module Admin
  # resource conroller offers
  class OffersController < ApplicationController
    before_action :load_offers, only: :index
    before_action :load_offer, except: :index

    def index; end

    def new; end

    def create
      Offer.create!(offers_params)
      flash[:success] = t('offer.create_success')
      redirect_to admin_offers_path
    rescue ActiveRecord::RecordInvalid => e
      flash[:error] = e.record.errors.first
      redirect_to new_admin_offer_path
    end

    def edit; end

    def update
      toggle_or_update
      flash[:success] = t('offer.update_success')
      redirect_to admin_offers_path
    rescue ActiveRecord::RecordInvalid => e
      flash[:error] = e.record.errors.first
      redirect_to edit_admin_offer_path
    end

    def toggle_or_update
      params[:toggle] ? @offer.toggle! : @offer.update!(offers_params)
    end

    private

    def load_offers
      @offers = Offer.all
    end

    def load_offer
      @offer = params[:id] ? Offer.find(params[:id]) : Offer.new
    end

    def offers_params
      params.require(:offer).permit(
        :advertiser_name, :url, :description, :premium, :starts_at, :ends_at
      )
    end
  end
end
