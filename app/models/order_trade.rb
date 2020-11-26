class OrderTrade 
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city, :house_num, :building_name, :tel, :token, :item_id, :user_id
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, numericality: true
    validates :city
    validates :house_num
    validates :tel, format: {with: /\A[0-9]+\z/, messages: "can't be blank"}
    validates :token
  end
  def save
    trade = Trade.create(item_id: item_id, user_id: user_id)
    Order.create(post_code: post_code, prefecture: prefecture, city: city, house_num: house_num, building_name: building_name, tel: tel, trade_id: trade.id)
  end
  
end