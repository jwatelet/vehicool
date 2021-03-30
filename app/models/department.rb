# frozen_string_literal: true

class Department < ApplicationRecord
  has_many :vehicles, dependent: :nullify
  validates :name, presence: true
end
