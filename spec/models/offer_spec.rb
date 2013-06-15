require 'spec_helper'

describe Offer do

  before(:each) do
    @offer = FactoryGirl.build(:offer)
  end

  it "is valid with valid attributes" do
    @offer.should be_valid
  end

  it "is not valid without a name" do
    @offer.name = nil
    @offer.should_not be_valid
  end

  it "is not valid without a start_date" do
    @offer.start_date = nil
    @offer.should_not be_valid
  end

  it "is not valid without an end_date" do
    @offer.end_date = nil
    @offer.should_not be_valid
  end

  #it "is not valid if end_date < start_date" do
  #  @offer.end_date = 10/07/2012
  #  @offer.start_date = 10/10/2012
  #  @offer.should_not be_valid
  #end


end