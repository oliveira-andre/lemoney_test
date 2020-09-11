# frozen_string_literal: true

# offer validation and associations
class Offer < ApplicationRecord
  validates :advertiser_name, :url, :description, :starts_at, presence: true
  validates :advertiser_name, uniqueness: true
  validates :description, length: { maximum: 500 }

  before_validation :set_starts_at

  private

  def set_starts_at
    self.starts_at = Time.zone.now
  end
end
