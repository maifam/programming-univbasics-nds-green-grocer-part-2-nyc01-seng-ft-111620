require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  
  
end 



def apply_clearance(cart)
  
  counter = 0 
  while counter < cart.length 
    if cart[counter][:clearance]
      cart[counter][:price] = (cart[counter][:price] - (cart[counter][:price] * 0.20)).round(2)
    end 
  counter +=1 
  end 
  cart 
end 


def checkout(cart, coupons)
  
  consolidated_cart = consolidate_cart(cart)
  discounted_cart = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(discounted_cart) 
  
  total = 0 
  counter = 0 
  while counter < final_cart.length
    total += final_cart[counter][:price] * final_cart[counter][:count]
    counter += 1 
  end 
  
  if total > 100 
    total -= (total * 0.10)
  end 
  total 
end 
    
