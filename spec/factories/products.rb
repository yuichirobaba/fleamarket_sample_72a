FactoryBot.define do
  
  factory :product do
    name              {"テスト"}
    price             {"1234567"}
    comment           {"テストコメントです。"}
    brand             {"monbel"}
    area              {"大阪府"}
    days              {"1~2日で発送"}
    shippingcharge    {"送料込み(出品者負担)"}
    category_id       {"1"}
    create_user_id    {"1"}
    status            {"新品"}
  end
end