require 'spec_helper'

describe "branches/index" do
  before(:each) do
    assign(:branches, [
      stub_model(Branch),
      stub_model(Branch)
    ])
  end

  it "renders a list of branches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
