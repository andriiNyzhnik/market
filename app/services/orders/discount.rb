module Orders
  class Discount
    def initialize(order)
      @order = order
    end

    def apply!
      Discounts::ALL.each do |rule_class|
        rule_class.discount(order).each do |order_item, discount|
          order_item.price -= discount
          order_item.save
        end
      end
    end

    private

    attr_reader :order
  end
end
