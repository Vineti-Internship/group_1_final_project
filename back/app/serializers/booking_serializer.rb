class BookingSerializer < ActiveModel::Serializer
  attributes :timespot_id,:user_id,:book_date
end