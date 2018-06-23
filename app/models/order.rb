
class Order
  
  attr_accessor :widgets_sold
  attr_accessor :company
  attr_accessor :date
  attr_accessor :amount_paid
  
  def initialize options
    puts(options)
    if options.respond_to? :each
      options.each do |key,val|
        target = "#{key}=".to_sym
        self.send(target, val) if self.respond_to?(target)
      end
    end
  end
  
end
