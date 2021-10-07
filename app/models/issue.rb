# frozen_string_literal: true

# == Schema Information
#
# Table name: issues
#
#  id         :bigint           not null, primary key
#  is_open    :boolean          default(FALSE)
#  kilometer  :integer
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  vehicle_id :bigint
#
# Indexes
#
#  index_issues_on_vehicle_id  (vehicle_id)
#
# Foreign Keys
#
#  fk_rails_...  (vehicle_id => vehicles.id)
#
class Issue < ApplicationRecord
  belongs_to :vehicle

  validates :kilometer, presence: true
  validates :text, length: { maximum: 1000 }
end
