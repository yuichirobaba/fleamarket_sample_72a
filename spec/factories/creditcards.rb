FactoryBot.define do
  factory :creditcard do
    card_number     {"1234567890123456"}
    card_company    {"VISA"}
    card_year       {"30"}
    card_month      {"12"}
    card_pass       {"123"}
  end
end
