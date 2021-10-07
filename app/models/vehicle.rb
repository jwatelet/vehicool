# frozen_string_literal: true

# == Schema Information
#
# Table name: vehicles
#
#  id             :bigint           not null, primary key
#  license_plate  :string
#  name           :string
#  serial_number  :string
#  tax_horsepower :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  brand_id       :bigint
#  department_id  :bigint
#
# Indexes
#
#  index_vehicles_on_brand_id       (brand_id)
#  index_vehicles_on_department_id  (department_id)
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (department_id => departments.id)
#
class Vehicle < ApplicationRecord
  belongs_to :brand
  belongs_to :department
  has_many :issues, dependent: :destroy

  validates :name, presence: true
  validates :brand_id, presence: true
  validates :department_id, presence: true

  after_create_commit { broadcast_append_to 'vehicles' }
  after_update_commit { broadcast_replace_to 'vehicles' }
  after_destroy_commit { broadcast_remove_to 'vehicles' }
end
