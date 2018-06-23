
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

end

