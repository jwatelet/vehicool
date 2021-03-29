# frozen_string_literal: true

class Brand < ApplicationRecord
  has_many :vehicles # rubocop:todo Rails/HasManyOrHasOneDependent

  validates :name, presence: true
end
