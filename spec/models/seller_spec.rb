
require 'rails_helper'

RSpec.describe Seller do
  before(:each) do
    @seller_hash = {
      :name => 'TestSeller',
      :sale_price => '100',
      :type => Seller.seller
    }
  end
  
  subject(:seller) { Seller.new @seller_hash }
  
  it "should be an Seller" do
    expect(subject).to be_a(Seller)
  end
  
  it "should be named TestSeller" do
    expect(subject.name).to eql(@seller_hash[:name]);
  end
end

