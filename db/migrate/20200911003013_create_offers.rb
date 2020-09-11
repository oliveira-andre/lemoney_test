# frozen_string_literal: true

# create table offers
class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :advertiser_name, null: false, uniqueness: true
      t.string :url, null: false
      t.text :description, null: false, limit: 500
      t.boolean :premium, null: false, default: false
      t.datetime :starts_at, null: false
      t.datetime :ends_at
    end
  end
end
