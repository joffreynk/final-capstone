class VehicleSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :price_per_day, :model, :description, :color, :user_id, :picture, :picture_url
end
