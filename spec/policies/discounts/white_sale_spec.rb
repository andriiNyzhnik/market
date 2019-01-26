require 'rails_helper'

describe Discounts::WhiteSale do
  describe '#discount' do
    let(:quantity) { 2 }
    let(:order) { create(:order) }
    let(:food_category) { create(:category, name: Categories::FOOD) }
    let(:computer_category) { create(:category, name: Categories::COMPUTER) }
    let(:food) { create(:product, :white, category: food_category) }
    let(:mouse) { create(:product, :white, category: computer_category) }
    let!(:order_item) { order.order_items.create(product: food, quantity: quantity, price: food.price * quantity) }
    let!(:order_item2) { order.order_items.create(product: mouse, price: mouse.price) }
    let(:service) { described_class.new(order) }

    context "when order doesn't has 10 white items" do
      it 'returns empty array' do
        expect(service.discount).to eq []
      end
    end

    context 'when order has 10 white items' do
      let(:quantity) { 10 }
      let(:discount) { described_class::PERCENTAGE_DISCOUNT }

      it 'returns discount for each item' do
        expect(service.discount).to contain_exactly([order_item, food.price * quantity * discount],
                                                    [order_item2, mouse.price * discount])
      end
    end
  end
end
