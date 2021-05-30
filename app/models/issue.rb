# frozen_string_literal: true

class Issue < ApplicationRecord
  belongs_to :vehicle

  validates :kilometer, presence: true
  validates :text, length: { maximum: 1000 }
end
