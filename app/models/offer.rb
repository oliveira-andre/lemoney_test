# frozen_string_literal: true

# offer validation and associations
class Offer < ApplicationRecord
  validates :advertiser_name, :url, :description, :starts_at, presence: true
  validates :advertiser_name, uniqueness: true
  validates :description, length: { maximum: 500 }

  validate :valid_url

  before_validation :set_starts_at

  def enabled?
    return Time.zone.now >= starts_at unless ends_at

    Time.zone.now >= starts_at && Time.zone.now <= ends_at
  end

  def status
    enabled? ? 'enabled' : 'disabled'
  end

  def toggle!
    if enabled?
      update(ends_at: Time.zone.now)
    else
      update(starts_at: Time.zone.now, ends_at: nil)
    end
  end

  private

  def valid_url
    return if url.match?(URL_MATCHES)

    @errors.add(:url, I18n.t('validations.offer.url.invalid'))
  end

  def set_starts_at
    self.starts_at = Time.zone.now unless starts_at
  end
end
