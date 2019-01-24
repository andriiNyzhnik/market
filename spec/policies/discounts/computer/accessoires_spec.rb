require 'rails_helper'

describe Discounts::Computer::Accessoires do
  let(:order) { create(:order) }
  let(:service) { described_class.new(order) }
  let(:discount) { described_class::PERCENTAGE_DISCOUNT }
  let(:mouse) { create(:product, category: mouse_category) }
  let(:keyboard) { create(:product, category: keyboard_category) }
  let(:mouse_category) { create(:category, name: Categories::MOUSE) }
  let(:keyboard_category) { create(:category, name: Categories::KEYBOARD) }
  let!(:order_item) { order.order_items.create(product: mouse, price: mouse.price) }

  describe '#discount' do
    context 'when only one mouse is present' do
      it 'returns empty array' do
        expect(service.discount).to eq []
      end
    end

    context 'when mouse and keyboard are present' do
      let!(:order_item2) { order.order_items.create(product: keyboard, price: keyboard.price) }

      it 'returns discount for each item' do
        expect(service.discount).to contain_exactly([order_item, order_item.product.price * discount],
                                                    [order_item2, order_item2.product.price * discount])
      end
    end

    context 'when has 2 mice and 2 keyboards' do
      let!(:order_item2) { order.order_items.create(product: keyboard, price: keyboard.price) }
      let!(:order_item3) { order.order_items.create(product: keyboard, price: keyboard.price) }
      let!(:order_item4) { order.order_items.create(product: mouse, price: mouse.price) }

      it 'returns discount for each item' do
        expect(service.discount).to contain_exactly([order_item, order_item.product.price * discount],
                                                    [order_item2, order_item2.product.price * discount],
                                                    [order_item3, order_item2.product.price * discount],
                                                    [order_item4, order_item2.product.price * discount])
      end
    end
  end
end
