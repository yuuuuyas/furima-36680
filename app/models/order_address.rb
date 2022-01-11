class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, post_code: post_code, area_id: area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end