require 'rails_helper'

describe Discounts::Food::EveningSale do
  describe '#discount' do
    let(:quantity) { 2 }
    let(:time) { Time.new(2002, 10, 31, 19, 2) }
    let(:order) { create(:order, created_at: time) }
    let(:food_category) { create(:category, name: Categories::FOOD) }
    let(:computer_category) { create(:category, name: Categories::COMPUTER) }
    let(:food) { create(:product, category: food_category) }
    let(:mouse) { create(:product, category: computer_category) }
    let!(:order_item) { order.order_items.create(product: food, quantity: quantity, price: food.price * quantity) }
    let!(:order_item2) { order.order_items.create(product: mouse, price: mouse.price) }
    let(:service) { described_class.new(order) }

    context 'when it is before 6 pm' do
      let(:time) { Time.new(2002, 10, 31, 5, 2) }

      it 'returns empty array' do
        expect(service.discount).to eq []
      end
    end

    context 'when time is after 6 pm' do
      let(:discount) { described_class::PERCENTAGE_DISCOUNT }

      context 'and has more that one same food item' do
        it 'returns discount for all food item quantity' do
          expect(service.discount).to eq([[order_item, order_item.quantity * discount * food.price]])
        end
      end

      context 'and has more that one food item' do
        let!(:order_item3) { order.order_items.create(product: food) }

        it 'returns discount for each item' do
          expect(service.discount).to contain_exactly([order_item, order_item.quantity * discount * food.price],[order_item3, food.price * discount])
        end
      end
    end
  end
end
