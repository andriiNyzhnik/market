# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.create!(email: 'valer4uk95@gmail.com', first_name: 'Valera', last_name: 'Bobr', phone: '0564535956')

# brands
logitech = Brand.create!(name: 'Logitech')
halytska_zdoba = Brand.create!(name: 'Галицька здоба')
molokia = Brand.create!(name: 'Молокія')

# product types
food_type = ProductType.create!(name: ProductTypes::Categories::FOOD)
computer_type = ProductType.create!(name: ProductTypes::Categories::COMPUTER)
mouse_type = computer_type.child_product_types.create!(name: 'mouse')
keyboard_type = computer_type.child_product_types.create!(name: 'keyboard')

# products
mouse = Product.create!(name: 'pro2', product_type: mouse_type, color: 'white', price: 5.67, brand: logitech, description: 'bla')
keyboard = Product.create!(name: 'pro3', product_type: keyboard_type, color: 'white', price: 12.35, brand: logitech, description: 'bla')
bread = Product.create!(name: 'Висівковий', product_type: food_type, color: 'gray', price: 1.25, brand: halytska_zdoba, description: 'bla')
milk = Product.create!(name: 'default', product_type: food_type, color: 'white', price: 2.25, brand: molokia, description: 'bla')

