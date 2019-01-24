module Discounts
  module Food
    class EveningSale < Base
      PERCENTAGE_DISCOUNT = 0.05 # 5%

      def discount
        return [] if order.created_at.hour < 5

        order.order_items.by_category(category).map do |order_item|
          [order_item, order_item.product.price * PERCENTAGE_DISCOUNT * order_item.quantity]
        end
      end

      private

      def category
        @category ||= Category.find_by(name: Categories::FOOD)
      end
    end
  end
end
