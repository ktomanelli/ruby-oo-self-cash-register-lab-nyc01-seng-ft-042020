class CashRegister
    attr_accessor :discount, :total, :last_transaction
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @cart = []
    end
    def add_item(item,price,quantity=1)
        @last_transaction = {:item =>item,:price =>price, :count=>quantity }
        quantity.times do|i|
            @cart << {:item =>item,:price =>price, :count=>1}
        end

        @total += price*quantity
    end
    def apply_discount
        if(@discount!=0)
            @total-=@total*@discount/100.0
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end
    def items
        # @cart
        @cart.map do |i|
            i[:item]
        end
    end
    def void_last_transaction
        @total-=@last_transaction[:price]*@last_transaction[:count]
        @cart.pop()
        @cart
    end
end

myCash = CashRegister.new(20)

puts myCash.add_item("apple", 0.99)
puts myCash.add_item('tomato',1.76)
myCash.void_last_transaction
puts myCash.total
