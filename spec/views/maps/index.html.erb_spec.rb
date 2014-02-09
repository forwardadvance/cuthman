require 'spec_helper'

describe "maps/index" do
  before(:each) do
    assign(:maps, [
      stub_model(Map,
        :lat => 1,
        :lng => 2,
        :zoom => 3,
        :type => "Type"
      ),
      stub_model(Map,
        :lat => 1,
        :lng => 2,
        :zoom => 3,
        :type => "Type"
      )
    ])
  end

  it "renders a list of maps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
