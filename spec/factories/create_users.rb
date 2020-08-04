FactoryBot.define do
  
  factory :create_user do
    nickname              {"hoge"}
    email                 {"hoge@gmail.com"}
    password              {"1234567"}
    password_confirmation {"1234567"}
    family_name           {"阿部"}
    first_name             {"琢磨"}
    family_name_kana      {"アベ"}
    first_name_kana       {"タクマ"}
    birthday_year         {"2000"}
    birthday_month        {"1"}
    birthday_day          {"1"}
  end
end
