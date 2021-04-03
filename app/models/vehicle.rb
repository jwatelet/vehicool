# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :brand
  belongs_to :department

  validates :name, presence: true
  validates :brand_id, presence: true
  validates :department_id, presence: true

  after_create_commit { broadcast_append_to 'vehicles' }
  after_update_commit { broadcast_replace_to 'vehicles' }
  after_destroy_commit { broadcast_remove_to 'vehicles' }
end
