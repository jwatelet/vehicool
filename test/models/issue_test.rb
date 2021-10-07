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
require 'test_helper'

class IssueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
