
module Reports

  class ReportRow
    attr_accessor :unitsSold
    attr_accessor :companyType
  end
  
  def Reports.generate_report
    
  end
    
  def Reports.generate_orders
    orders = []
    report = {}
    (1..100).each do |n|
      company = @companyLookup[ Random.new.rand(1..6) ]
      order = Order.new({
          :widgets_sold => Random.new.rand(1..100),
          :company => company,
          :amount_paid => company.sale_price,
          :date => Date.today
      })
      orders.push(order)
      if report[order.company.name].nil?
        report[order.company.name] = ReportRow.new()
      end
      report[order.company.name].unitsSold += order.widgets_sold
    end
    {:orders => orders, :report => report}
  end

  @widgetsInc = Seller.new ( {
    :name => "Widgets Inc",
    :sale_price => 50.00,
    :type => Company.seller
  })

  @affiliateA = Affiliate.new({
    :name => "ACompany",
    :sale_price => 75.00,
    :type => Company.affiliate
  })

  @affiliateB = Affiliate.new({
    :name => "AnotherCompany",
    :sale_price => 65.00,
    :type => Company.affiliate
  })

  @affiliateC = Affiliate.new({
    :name => "EvenMoreCompany",
    :sale_price => 80.00,
    :type => Company.affiliate
  })

  @resellerA = Reseller.new({
    :name => "ResellThis",
    :sale_price => 75.00,
    :type => Company.reseller
  })

  @resellerB = Reseller.new({
    :name => "SellMoreThings",
    :sale_price => 85.00,
    :type => Company.reseller
  })

  @companyLookup = {
    1 => @widgetsInc,
    2 => @affiliateA,
    3 => @affiliateB,
    4 => @affiliateC,
    5 => @resellerA,
    6 => @resellerB
  }
end

#  We have the following Affiliates:
#	 ACompany – Sells the widget for $75/ea
#          AnotherCompany – Sells the widget for $65/ea
#          EvenMoreCompany – Sells the widget for $80/ea
#
# 3. Resellers who resell our widget based on a flat billing system. They pay us $50 per widget.
# We have the following Resellers:
#            ResellThis  – Sells the widget for $75
#            SellMoreThings – Sells the widget for $85