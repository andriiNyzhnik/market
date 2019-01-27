require 'rails_helper'

describe Orders::Discount do
  let(:quantity) { 2 }
  let(:order) { create(:order) }
  let(:computer_category) { create(:category, name: Categories::COMPUTER) }
  let(:mouse) { create(:product, :white, category: computer_category) }
  let!(:order_item) { order.order_items.create(product: mouse, price: mouse.price * quantity, quantity: quantity) }
  let(:service) { described_class.new(order) }

  describe '#apply!' do
    context 'when discount present' do
      let(:quantity) { 10 }

      it 'updates item price' do
        expect {
          service.apply!
        }.to change { order_item.reload.price }
      end
    end

    context "when discount doesn't present" do
      it "doesn't update item price" do
        expect {
          service.apply!
        }.not_to change { order_item.reload.price }
      end
    end
  end
end
