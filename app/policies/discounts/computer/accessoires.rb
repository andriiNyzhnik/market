module Discounts
  module Computer
    class Accessoires < Base
      PERCENTAGE_DISCOUNT = 0.03 # 3%

      def discount
        discounts = []
        mice.each_with_index do |mouse_item, index|
          next unless keyboards[index]

          discounts << item_with_discount(mouse_item)
          discounts << item_with_discount(keyboards[index])
        end

        discounts
      end

      private

      def mouse_category
        Category.find_by(name: Categories::MOUSE)
      end

      def keyboard_category
        Category.find_by(name: Categories::KEYBOARD)
      end

      def mice
        order.order_items.by_category(mouse_category)
      end

      def keyboards
        order.order_items.by_category(keyboard_category)
      end

      def item_with_discount(order_item)
        [order_item, order_item.product.price * PERCENTAGE_DISCOUNT]
      end
    end
  end
end
