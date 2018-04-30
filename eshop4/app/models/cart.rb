class Cart < ActiveRecord::Base
has_many :cart_items
 has_many :liquors, :through => :cart_items

 def add(liquor_id)
   items = cart_items.where(liquor_id: liquor_id)
   liquor = Liquor.find liquor_id
   if items.size < 1
     ci = cart_items.create :liquor_id => liquor_id, :amount => 1, :price => liquor.price
   else
     ci = items.first
     ci.update_attribute :amount, ci.amount + 1
   end
   ci
 end

 def remove(liquor_id)
   ci = cart_items.where(liquor_id: liquor_id).first
   if ci.amount > 1
     ci.update_attribute :amount, ci.amount - 1
   else
     CartItem.destroy ci.id
   end
   ci
 end

 def total
   sum = 0
   cart_items.each do |item| sum += item.price * item.amount end
   sum
 end
end
