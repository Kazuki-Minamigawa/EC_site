# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "admin@example.com",
  password: "wwwwww"
)
Genre.create!(
  name: "ジャンル名",
  is_allowed: "有効"
)
Item.create!(
  name: "商品名",
  introduction: "商品説明文"
)
Order.create!(
  postage: 800,
  ordered_process: "waiting",
  payment_method: "card"
)
Address.create!(
  address: "大阪府",
  zip_code: "7777777",
  name: "大阪太郎"
)
OrderDetail.create!(
  made_process: "until"
)
