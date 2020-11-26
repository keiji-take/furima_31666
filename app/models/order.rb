class Order < ApplicationRecord
  belongs_to :trade
  attr_accessor :token
  belongs_to :items
end
