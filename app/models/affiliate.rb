
class Affiliate < Company
  
  def self.cost total_affiliates  
    raise "Invalid arguments" if !total_affiliates.is_a?(Numeric)
    
    rv = 0
    case total_affiliates
    when 0..500
      rv = 60.00
    when 501..1000
      rv = 50.00
    else total_affiliates > 1000
      rv = 40.00
    end
    
    rv
  end
  
  def total_cost num_orders 
    return (Affiliate.cost num_orders) * num_orders
  end
end
