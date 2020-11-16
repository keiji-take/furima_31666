class Item < ApplicationRecord
  belongs_to :user

  def was_attached?
    self.image.attached?
  end
end
