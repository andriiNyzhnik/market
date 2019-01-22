module Orders
  class Purchase
    def initialize(user)
      @user = user
    end

    def add_product!(product)
      add_to_order(product)
    end

    def finalize!
      Orders::Discount.calculate!(order)
    end

    private

    attr_reader :user

    def order
      @order ||= user.orders.create(status: Order.statuses[:draft])
    end

    def add_to_order(product)
      if (order_item = order.order_items.by_product(product).first)
        order_item.quantity += 1
        order_item.save
      else
        order.order_items.create(product: product, price: product.price)
      end
    end
  end
end
