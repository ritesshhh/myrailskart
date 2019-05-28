# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do 
	Product.create({
		name: Faker::Book.title,
		expire_date: Faker::Date.between(2.days.ago, Date.today),
		sku_id: Faker::Number.number(5),
		images: 'http://power.itp.ac.cn/~jmyang/funny/fun4.jpg',
		price: Faker::Number.decimal(5, 2)
		})
end
