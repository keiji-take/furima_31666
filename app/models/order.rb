class Order < ApplicationRecord
  attr_accessor :token
  has_many :items
  validates :token, presence: true

  with_options presence: true do
    validates :post_code
    validates :prefecture
    validates :city
    validates :house_num
    validates :tel
  end
end
