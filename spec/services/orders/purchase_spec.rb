require 'rails_helper'

describe Orders::Purchase do
  let(:user) { create(:user) }
  let(:mouse) { create(:product, name: 'mouse') }
  let(:service) { described_class.new(user) }

  describe '#add_product!' do
    it 'creates order' do
      expect {
        service.add_product!(mouse)
      }.to change(Order, :count).by(1)
    end

    context "when product doesn't exist in order yet" do
      it 'creates order item' do
        expect {
          service.add_product!(mouse)
        }.to change { OrderItem.by_product(mouse).count }.by(1)
      end
    end

    context 'when product exist in order already' do
      let(:order_item) { user.orders.last.order_items.first }

      before { service.add_product!(mouse) }

      it 'increments order item count' do
        expect {
          service.add_product!(mouse)
        }.to change { order_item.reload.quantity }.by(1)
      end

      it 'updates price' do
        expect {
          service.add_product!(mouse)
        }.to change { order_item.reload.price }.by(mouse.price)
      end
    end
  end

  describe '#apply_discount!' do
    before { service.add_product!(mouse) }

    it 'calls discount service' do
      expect(Orders::Discount).to receive(:apply!).with(user.orders.last)

      service.apply_discount!
    end
  end
end
