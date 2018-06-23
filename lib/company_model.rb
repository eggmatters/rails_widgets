
class Company
  
  @@company     = 'company'
  @@reseller    = 'reseller'
  @@affiliate   = 'affiliate'
  
  attr_accessor :name
  attr_accessor :sale_price
  attr_accessor :type
  
  def initialize
    if options.respond_to? :each
      options.each do |key,val|
        target = "#{key}=".to_sym
        self.send(target, val) if self.respond_to?(target)
      end
    end
  end
end
