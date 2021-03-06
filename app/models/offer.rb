# frozen_string_literal: true

# offer validation and associations
class Offer < ApplicationRecord
  scope :actives, -> { Offer.all.map { |offer| offer if offer.enabled? }.compact! }

  validates_presence_of :advertiser_name, :url, :description, :starts_at
  validates :advertiser_name, uniqueness: true
  validates :description, length: { maximum: 500 }

  validate :valid_url
  validate :ends_at_in_past

  def enabled?
    return Time.zone.now >= starts_at unless ends_at

    Time.zone.now >= starts_at && Time.zone.now <= ends_at
  end

  def status
    enabled? ? 'enabled' : 'disabled'
  end

  def toggle!
    if enabled?
      update(starts_at: Time.zone.now, ends_at: Time.zone.now)
    else
      update(starts_at: Time.zone.now, ends_at: nil)
    end
  end

  private

  def valid_url
    return if !url || url.match?(URL_MATCHES)

    @errors.add(:url, I18n.t('validations.offer.url.invalid'))
  end

  def ends_at_in_past
    return if !ends_at || starts_at <= ends_at

    @errors.add(:ends_at, I18n.t('validations.offer.ends_at.past'))
  end
end
