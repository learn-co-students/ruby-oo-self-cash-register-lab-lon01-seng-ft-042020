
class CashRegister

    def initialize(discount=0)
        @total = 0
        @discount = discount
    end

    attr_reader :discount, :items
    attr_accessor :total
    

    def add_item(item, price, quantity = 1)
        @total += quantity * price
        @items ||=[]
        @last_item = {item: item, price: price, quantity: quantity}
        quantity.times {@items << item}
    end

    def void_last_transaction
        @total -= (@last_item[:price]*@last_item[:quantity])
        @last_item = nil
    end
    
    def apply_discount        
        if discount > 0
            @total = @total.to_f*(100.00-@discount.to_f)/(100.00)
            "After the discount, the total comes to $#{@total.round(0)}."
        else
            "There is no discount to apply."
        end
    end

end