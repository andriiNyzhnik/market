# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'factory_bot_rails'
require 'faker'

FactoryBot.create(:user)

# brands
logitech = FactoryBot.create(:brand, name: 'Logitech')
halytska_zdoba = FactoryBot.create(:brand, name: 'Галицька здоба')
molokia = FactoryBot.create(:brand, name: 'Молокія')

# product types
food_type = FactoryBot.create(:category, name: Categories::FOOD)
computer_type = FactoryBot.create(:category, name: Categories::COMPUTER)
mouse_type = computer_type.child_categories.create!(name: Categories::MOUSE)
keyboard_type = computer_type.child_categories.create!(name: Categories::KEYBOARD)

# products
Product.create!(name: 'pro2', category: mouse_type, color: Colors::WHITE, price: 5.67, brand: logitech, description: 'bla')
Product.create!(name: 'pro3', category: keyboard_type, color: Colors::WHITE, price: 12.35, brand: logitech, description: 'bla')
Product.create!(name: 'Висівковий', category: food_type, color: Colors::GREEN, price: 1.25, brand: halytska_zdoba, description: 'bla')
Product.create!(name: 'default', category: food_type, color: Colors::WHITE, price: 2.25, brand: molokia, description: 'bla')

