# frozen_string_literal: true

FactoryBot.define do
  factory :offer do
    advertiser_name { FFaker::Lorem.unique.word }
    description { FFaker::Lorem.phrase }
    url { FFaker::Internet.http_url }
    starts_at { Time.zone.now }

    trait :disabled do
      ends_at { Time.zone.now }
    end

    trait :premium do
      premium { true }
    end

    factory :offer_disabled, traits: [:disabled]
    factory :offer_premium, traits: [:premium]
  end
end
