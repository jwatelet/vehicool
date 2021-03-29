# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :brand
  belongs_to :department

  validates :name, presence: true
  validates :brand_id, presence: true
  validates :department_id, presence: true
end
