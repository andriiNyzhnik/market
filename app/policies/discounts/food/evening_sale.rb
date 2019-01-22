module Discounts
  module Food
    class EveningSale < Base
      def discount
        return [] if order.created_at.hour < 5

        order.order_items.by_product_type(product_type).map do |order_item|
          [order_item, order_item.product.price * 0.05 * order_item.quantity]
        end
      end

      private

      def product_type
        @product_type ||= ProductType.find_by(name: 'food')
      end
    end
  end
end
