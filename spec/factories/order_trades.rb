FactoryBot.define do
  factory :order_trade do
    post_code { '111-1111' }
    prefecture { 11 }
    city { '東京' }
    house_num { '東京１−１' }
    building_name { '新東京ビル１０１' }
    tel { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
