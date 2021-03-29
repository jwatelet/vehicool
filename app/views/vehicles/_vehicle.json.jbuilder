# frozen_string_literal: true

json.extract! vehicle, :id, :name, :license_plate, :brand, :serial_number, :tax_horsepower, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
