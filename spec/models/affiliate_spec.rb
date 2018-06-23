
require 'rails_helper'

RSpec.describe Affiliate, type: :model do
  before(:each) do
    @affiliate_hash = {
      :name => 'TestAffiliate',
      :sale_price => '100',
      :type => Affiliate.affiliate
    }
  end
  
  subject(:affiliate) { Affiliate.new @affiliate_hash }
  
  it "should be an Affiliate" do
    expect(subject).to be_a(Affiliate)
  end
  
  it "should be named TestAffiliate" do
    expect(subject.name).to eql(@affiliate_hash[:name]);
  end
  
  it "should return cost for < 500 widgets" do
    expect(Affiliate.cost 499).to eql(60.00)
  end
  
  it "should return cost for < 1000 widgets" do
    expect(Affiliate.cost 999).to eql(50.00)
  end
  
  it "should return cost for > 1001 widgets" do
    expect(Affiliate.cost 1002).to eql(40.00)
  end
  
  it "should raise error for invalid arguments" do
    expect{Affiliate.cost 'abc'}.to raise_error("Invalid arguments")
  end
end

