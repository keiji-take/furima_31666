class SendDay < ActiveHash::Base
  self.data = [
    { id: 1, name: '翌日発送' },
    { id: 2, name: '2-3日発送' },
    { id: 3, name: '４−7日発送' }
  ]
  include ActiveHash::Associations
  has_many :items
end
