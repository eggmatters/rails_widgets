require 'rails_helper'

RSpec.describe Order, type: :model do
  
  before(:each) do
    @ah =  { :name => "TestAffiliate", :sale_price => 100, :type => Company.affiliate }
    @affiliate = Affiliate.new @ah
    @oh = {
      :widgets_sold => 100,
      :company => @affiliate,
      :date => Date.new,
      :amount_paid => @ah[:sale_price] * 100
    }
  end
  
  subject(:order) { Order.new @oh }

  it "should be an Order" do
    expect(subject).to be_a(Order)
  end
  
  it "should assign Affiliate" do
    expect(subject.company).to be_a(Affiliate)
  end
end

