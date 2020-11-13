require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  
  coupons.each do |coupon| 
    current_item = find_item_by_name_in_collection(coupon[:item], cart)
      if current_item && current_item[:count] >= coupon[:num]
        cart << {:item => current_item[:item] + "W/ COUPON", :price => coupon[:cost]/coupon[:num], :clearance => current_item[:clearance], :count => coupon[:num]}
        current_item[:count] -= coupon[:num]
      end 
    end 
  cart 
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
    
