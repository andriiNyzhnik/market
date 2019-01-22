module Discounts
  class Base
    def initialize(order)
      @order = order
    end

    def discount
      fail NotImplementedError
    end

    def self.discount(*args)
      new(*args).discount
    end

    private

    attr_reader :order
  end
end
