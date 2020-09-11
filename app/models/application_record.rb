# frozen_string_literal: true

# Loading Active Record base rails
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
