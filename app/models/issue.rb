# frozen_string_literal: true

class Issue < ApplicationRecord
  validates :kilometer, presence: true
  validates :text, length: { maximum: 1000 }

  belongs_to :vehicle
end
