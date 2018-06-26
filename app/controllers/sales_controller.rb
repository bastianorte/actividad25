class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end

 def create
   @sale = Sale.new(sales_params)
   @sale[:value] = @sale[:value] + (@sale[:value] * @sale[:discount]/ 100).to_i

   excento = @sale[:tax]
   if excento == 0
     @sale[:value] = (@sale[:value]*1.19).to_i
     @sale[:tax] = 19
     end
     @sale.save
     redirect_to sales_done_path
    end


 def done
   @sale = Sale.last

   end

 private
def sales_params
 @sale = Sale.new
 params.require(:sale).permit(:cod,:detail,:category,:value,:discount,:tax)
end
end
