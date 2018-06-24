require 'rails_helper'

RSpec.describe Reseller, type: :model do
  before(:each) do
    @reseller_hash = {
      :name => 'TestReseller',
      :sale_price => '100',
      :type => Reseller.reseller
    }
  end
  
  subject(:reseller) { Reseller.new @reseller_hash }
  
  it "should be an Reseller" do
    expect(subject).to be_a(Reseller)
  end
  
  it "should be named TestReseller" do
    expect(subject.name).to eql(@reseller_hash[:name]);
  end

end
