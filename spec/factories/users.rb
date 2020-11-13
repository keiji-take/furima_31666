FactoryBot.define do
  factory :user do
    nickname              {"rspec1"}
    email                 {"rspec@t.com"}
    password              {"rspec11"}
    password_confirmation {"rspec11"}
    last_name             {"テスト"}
    first_name            {"太朗"}
    last_name_kana        {"テスト"}
    first_name_kana       {"タロウ"}
    birth_date            {"2000-11-15"}
  end
end
