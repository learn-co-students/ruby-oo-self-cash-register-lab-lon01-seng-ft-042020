require "pry"
# EITHER RUN THIS

# class CashRegister
#     attr_accessor :total, :discount, :items

#     def initialize(discount = 0)
#         @total = 0
#         @discount = discount
#         @items = []
#         @last_price = 0

#     end 

#     def add_item(title, price, quantity = 1)
#         quantity.times do
#         @items << title
#         @last_price = price*quantity
#         #conceptually this doesn't make sense. I forgot but its something abotu quantity, if its a group of the same item eg. 3 bananas 
#         end
#         self.total += price*quantity
#     end

#     def apply_discount
#         if @discount > 0
#             self.total = self.total - (self.total * (@discount.to_f/100))
#             "After the discount, the total comes to $#{self.total.to_i}."
#         else    
#             "There is no discount to apply."
#         end
#     end

#     def items 
#         @items
#     end

#     def void_last_transaction
#       self.total -= @last_price
#     end
# end

#OR RUN THIS

class CashRegister
    attr_accessor :total, :discount, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end 

    def add_item(title, price, quantity = 1)
        item_hash = {
            :title => title,
            :price => price,
            :quantity => quantity
        }
        quantity.times do
            @items << item_hash
        end
        self.total += price*quantity 
    end

    def apply_discount
        if @discount > 0
            self.total = self.total - (self.total * (@discount.to_f/100))
            "After the discount, the total comes to $#{self.total.to_i}."
        else    
            "There is no discount to apply."
        end
    end

    def items 
        item_names =[]
        @items.each do |item|
            item_names << item[:title]
        end
        item_names
    end

    def void_last_transaction
        self.total -= @items[-1][:price]*@items[-1][:quantity]
        #same thing here about p*q
    end
end