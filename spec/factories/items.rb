FactoryBot.define do
  factory :item do
    product      { '商品めい' }
    exception    { 'しょうひん説明文' }
    category_id  { '3' }
    condition_id { '2' }
    payer_id     { '2' }
    location_id  { '20' }
    send_day_id  { '2' }
    price        { '10200' }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/test-image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
