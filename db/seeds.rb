# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |n|
  Customer.create!(
    last_name: "玉#{n + 1}",
    first_name: "五知#{n + 1}",
    last_name_furigana: "タマ#{n + 1}",
    first_name_furigana: "ゴッチ#{n + 1}",
    postal_code: "1111111",
    address: "テスト県テスト市テスト",
    telephone_number: "08011111111",
    email: "test#{n + 1}@gmail.com",
    password: "123456",
    is_active: true
  )
end

Admin.create!(
  email: "admin@admin.com",
  password: "administrator"
  )

3.times do |n|
 Address.create!(
  customer_id: n+1,
  postal_code: "1111111",
  address: "テスト県テスト市テスト#{n + 1}",
  name: "テストマンション10#{n + 1}号室"
   )
  end

Genre.create!(
  name: "ケーキ"
  )
Genre.create!(
  name: "プリン"
  )
Genre.create!(
  name: "焼き菓子"
  )
Genre.create!(
  name: "キャンディ"
  )

Item.create!(
  name: "タマゴケーキ",
  explanation: "タマゴケーキです",
  excluding_tax_price: 5300,
  genre_id: 1,
  is_on_sale: true
  )

Item.create!(
  name: "タマゴプリン",
  explanation: "タマゴプリンです",
  excluding_tax_price: 1300,
  genre_id: 2,
  is_on_sale: true
  )

Item.create!(
  name: "タマゴクッキー",
  explanation: "タマゴクッキーです",
  excluding_tax_price: 1000,
  genre_id: 3,
  is_on_sale: true
  )

Item.create!(
  name: "タマゴキャンディ",
  explanation: "タマゴキャンディです",
  excluding_tax_price: 2500,
  genre_id: 4,
  is_on_sale: true
  )

# Order.create!(
#   customer_id: 1,
#   # チーズケーキとシュークリーム購入
#   total_payment: 495,
#   payment_option: 0,
#   shipping_fee: 800,
#   shipping_address: "テスト県テスト市テスト1",
#   shipping_postcode: "1111111",
#   shipping_name: "テストマンション101号室",
#   order_status: 0
#   )

# Order.create!(
#   customer_id: 2,
#   # プリンとマシュマロキャンディ購入
#   total_payment: 550,
#   payment_option: 0,
#   shipping_fee: 800,
#   shipping_address: "テスト県テスト市テスト1",
#   shipping_postcode: "1111111",
#   shipping_name: "テストマンション102号室",
#   order_status: 0
#   )

# OrderDetail.create!(
#   item_id: 1,
#   order_id: 1,
#   amount: 1,
#   price_including_tax: 330,
#   production_status: 0
#   )

# OrderDetail.create!(
#   item_id: 2,
#   order_id: 1,
#   amount: 1,
#   price_including_tax: 165,
#   production_status: 0
#   )

# OrderDetail.create!(
#   item_id: 3,
#   order_id: 2,
#   amount: 1,
#   price_including_tax: 220,
#   production_status: 0
#   )

# OrderDetail.create!(
#   item_id: 4,
#   order_id: 2,
#   amount: 1,
#   price_including_tax: 330,
#   production_status: 0
#   )