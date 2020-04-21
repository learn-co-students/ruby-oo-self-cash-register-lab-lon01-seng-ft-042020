require 'pry'
class CashRegister

    attr_accessor :discount, :total, :items 

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end
    def total
        @total
    end
    def add_item(item, price, qtd = 1)
        # if qtd > 1
        #     i = 0
        #     while i < qtd  
        #         @items << item
        #         i +=1
        #     end
        #     else 
        #     @items << item
        # end
        qtd.times do 
           @items << item
        end
        self.total += price*qtd
        @last_transaction = price*qtd
        #binding.pry
    end

    def apply_discount
        #binding.pry
        if discount > 0
        self.total = self.total*(1-self.discount*0.01)
        return "After the discount, the total comes to $#{self.total.to_i}."
        else 
            "There is no discount to apply."
        end
    end
    def items
        @items
    end
    def void_last_transaction
        @total -= @last_transaction
        #binding.pry
    end

end