# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Cart.destroy_all
ProductOrder.destroy_all
Order.destroy_all
Product.destroy_all
User.destroy_all
Category.destroy_all
Review.destroy_all



admin = User.create(
  name: 'Igor venegas',
  lastname: 'venegas',
  nickname: 'igor',
  email: 'admin@ecommerce.com',
  password: 'password',
  role: 0
)

users = []

(1..10).each do |i|
  users << User.create(
    name: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    nickname: Faker::Internet.user_name,
    email: "client_#{i}@mail.com",
    password: 'password',
    role: 1
  )
end


categories = []

categories << Category.create(name: 'Man')
categories << Category.create(name: 'Woman')
categories << Category.create(name: 'Sport')
categories << Category.create(name: 'Computers')
categories << Category.create(name: 'Children')
categories << Category.create(name: 'Toys')
categories << Category.create(name: 'Books')
categories << Category.create(name: 'Video Games')
categories << Category.create(name: 'Music')
categories << Category.create(name: 'Movies')
categories << Category.create(name: 'Others')


products = []

40.times do |p|
  products << Product.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(10, true, 10),
    price: Faker::Commerce.price,
    stock: Faker::Number.between(1, 20),
    category: categories[rand(categories.length)],
    remote_image_url: 'http://lorempixel.com/1200/800'
  )
end
review = []
(1..500).each do |r|
	review << Review.create(
	content: Faker::Lorem.paragraph(3),
	product: product[rand(product.length)]	)
end

5.times do |i|
  cart = Cart.new
  cart.user = users[0]
  cart.product = products.sample
  cart.quantity = Faker::Number.between(1, 10)
  cart.save
end

4.times do |i|
  cart = Cart.new
  cart.user = users[1]
  cart.product = products.sample
  cart.quantity = Faker::Number.between(1, 10)
  cart.save
end


order = Order.new
order.user = users[1]
order.status = 0
order.save


6.times do |i|
  po = ProductOrder.new
  po.order = order
  po.product = products.sample
  po.quantity = Faker::Number.between(1, 10)
  po.save
end