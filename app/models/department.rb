# frozen_string_literal: true

class Department < ApplicationRecord
  has_many :vehicles # rubocop:todo Rails/HasManyOrHasOneDependent

  validates :name, presence: true
end
