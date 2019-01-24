require 'rails_helper'

describe Orders::Purchase do
  describe '#add_product!' do
    let(:user) { create(:user) }
    let(:mouse) { create(:product, name: 'mouse') }

    subject { described_class.new(user) }

    it 'creates order' do
      expect {
        subject.add_product!(mouse)
      }.to change(Order, :count).by(1)
    end

    context "when product doesn't exist in order yet" do
      it 'creates order item' do
        expect {
          subject.add_product!(mouse)
        }.to change { OrderItem.by_product(mouse).count }.by(1)
      end
    end

    context 'when product exist in order already' do
      let(:order_item) { user.orders.last.order_items.first }

      before { subject.add_product!(mouse) }

      it 'increments order item count' do
        expect {
          subject.add_product!(mouse)
        }.to change { order_item.reload.quantity }.by(1)
      end

      it 'updates price' do
        expect {
          subject.add_product!(mouse)
        }.to change { order_item.reload.price }.by(mouse.price)
      end
    end
  end
end
