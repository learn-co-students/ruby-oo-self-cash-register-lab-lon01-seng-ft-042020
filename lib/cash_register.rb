
require "pry"
class CashRegister

    attr_accessor :total, :discount, :items

    def initialize (discount=0)
        @total = 0
        @discount = discount
        # the class CashRegister has class variable @items
        # array for collection of adding items
        @items = []
    end
    
    def add_item(name_of_product, price, quantity=1)
        self.total = self.total + (price * quantity)
        quantity.times do 
            # adding each product to ithems array 
            items << name_of_product 
        end 
        # add the class variable as a helper for method void_last_transaction
        # in that case self.last_transaction = @last_transaction
        # using class variable of self to get the access in another method
        @last_transaction = price * quantity
    end 
    
    def apply_discount
        if discount !=0
            self.total = (self.total * ((100.0 - discount.to_f)/100)).to_i
            "After the discount, the total comes to $#{self.total}."
        else 
            "There is no discount to apply."
        end      
    end 
    
    def void_last_transaction
        self.total = self.total - @last_transaction
    end
    
    # binding.pry 
end


