# frozen_string_literal: true

# helpers to offer views
module OfferHelper
  def enable_or_disable(offer)
    offer.enabled? ? '[disable]' : '[enable]'
  end
end
