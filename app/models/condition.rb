class Condition < ActiveHash::Base
  self.data = [
    { id: 1, name: '新品' },
    { id: 2, name: '未使用に近い' },
    { id: 3, name: '目立った傷汚れなし' },
    { id: 4, name: 'やや傷や汚れなし' },
    { id: 5, name: '傷や汚れあり' },
    { id: 6, name: '状態が悪い' }
  ]

  include ActiveHash::Associations
  has_many :items
end
