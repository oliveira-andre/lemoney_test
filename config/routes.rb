# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :offers, except: :show
  end

  root to: 'home#index'
end
