FactoryBot.define do
  factory :sns_credential do
    provider { "MyString" }
    uid { "MyString" }
    create_user { nil }
  end
end
