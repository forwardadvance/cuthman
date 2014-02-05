require 'spec_helper'

describe "widgets/show" do
  before(:each) do
    @widget = assign(:widget, stub_model(Widget,
      :page_id => 1,
      :template_location => "Template Location",
      :resource_id => 2,
      :resource_type => "Resource Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Template Location/)
    rendered.should match(/2/)
    rendered.should match(/Resource Type/)
  end
end
