class UserItem
  include ActiveModel::Model
  attr_accessor  :nickname, :post_code, :prefecture, :city, :house_num, :building_name, :tel, :price
  with_options presence: true do
    validates :post_code, format:{with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture
    validates :city
    validates :house_num
    validates :tel
  end
  


end
