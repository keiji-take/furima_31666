FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { 'テスト' }
    first_name            { '太朗' }
    last_name_kana        { 'テスト' }
    first_name_kana       { 'タロウ' }
    birth_date            { '2000-11-15' }
  end
end
