class Order < ApplicationRecord
  attr_accessor :token
  has_many :items
  validates :token, presence: true
end
