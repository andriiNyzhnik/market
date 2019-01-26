module Discounts
  class WhiteSale < Base
    MINIMUM_COUNT = 10
    PERCENTAGE_DISCOUNT = 0.1 # 10%

    def discount
      return [] if white_items.sum(:quantity) < MINIMUM_COUNT

      white_items.map do |item|
        [item, item.product.price * item.quantity * PERCENTAGE_DISCOUNT]
      end
    end

    private

    def white_items
      @white_items ||= order.order_items.by_color(Colors::WHITE)
    end
  end
end
