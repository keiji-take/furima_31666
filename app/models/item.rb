class Item < ApplicationRecord
  belongs_to :user

  def was_attached?
    image.attached?
  end
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :payer
  belongs_to :location
  belongs_to :send_day

  with_options presence: true do
    validates :product, length: { maximum: 40 }
    validates :exception, length: { maximum: 1000 }
    validates :image
    validates :category_id
    validates :condition_id
    validates :payer_id
    validates :location_id
    validates :send_day_id
    validates :price, numericality: { greater_than: 299, less_than: 10_000_000 }
  end
end
