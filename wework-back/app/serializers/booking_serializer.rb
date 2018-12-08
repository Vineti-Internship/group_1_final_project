class BookingSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :room
end
