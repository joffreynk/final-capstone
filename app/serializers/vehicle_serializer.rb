# frozen_string_literal: true

class VehicleSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :price_per_day, :model, :pict, :description, :color, :user_id, :picture_url
end
