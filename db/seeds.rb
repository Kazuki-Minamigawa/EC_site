# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "admin@example.com",
  encrypted_password: "wwwwww"
)
Genre.create!(
  name: "ジャンル名",
)
Item.create!(
  genre_id: 1,
  name: "商品名",
  introduction: "商品説明文",
  no_tax_price: 500,
)
Order.create!(
  end_user_id: 1,
  address: "東京都",
  zip_code: "0000000",
  name: "南川和紀",
  payment_method: 0,
)
Address.create!(
  end_user_id: 1,
  address: "大阪府",
  zip_code: "1111111",
  name: "大阪太郎"
)
OrderDetail.create!(
  order_id: 1,
  item_id: 1,
  item_amount: 1,
  tax_price: 500,
  made_process: 0
)
