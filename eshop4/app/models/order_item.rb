class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :liquor

  def validate
    errors.add(:amount, "debe ser uno o mas") unless amount.nil? || amount > 0
    errors.add(:price, "debe ser un número positivo") unless price.nil? || price > 0.0
  end
end
