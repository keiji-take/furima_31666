class Item < ApplicationRecord
  belongs_to :user

  def was_attached?
    self.image.attached?
  end
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :payer
  belongs_to :location
  belongs_to :send_day
  
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1}
  validates :condition_id, numericality: { other_than: 1}
  validates :payer_id, numericality: { other_than: 1}
  #validates :location_id, numericality: { other_than: 1}
  validates :send_day_id, numericality: { other_than: 1}
  
end
