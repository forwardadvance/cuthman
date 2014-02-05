require 'spec_helper'

describe "widgets/index" do
  before(:each) do
    assign(:widgets, [
      stub_model(Widget,
        :page_id => 1,
        :template_location => "Template Location",
        :resource_id => 2,
        :resource_type => "Resource Type"
      ),
      stub_model(Widget,
        :page_id => 1,
        :template_location => "Template Location",
        :resource_id => 2,
        :resource_type => "Resource Type"
      )
    ])
  end

  it "renders a list of widgets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Template Location".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Resource Type".to_s, :count => 2
  end
end
