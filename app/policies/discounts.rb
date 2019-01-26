module Discounts
  FOOD = [Food::EveningSale].freeze
  COMPUTER = [Computer::Accessoires].freeze
  GENERAL = [WhiteSale].freeze

  ALL = [FOOD + COMPUTER + GENERAL].freeze
end
