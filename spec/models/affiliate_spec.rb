
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')


RSpec.describe Affiliate, type: :model do
  before(:each) do
    @affilate_hash = {
      :name => 'TestAffiliate',
      :sale_price => '100',
      :type => Affiliate.affiliate
    }
  end
  
  subject(:affiliate) { Affiliate.new @affiliate_hash }
  
  it "should be an Affiliate" do
    expect(affiliate).to be_a(Affiliate)
  end
  
  it "should be named TestAffiliate" do
    expect(affiliate.name).to eql(@affiliate_hash[:name]);
  end

end

