require 'spec_helper'

describe "admin/images/show" do
  before(:each) do
    @admin_image = assign(:admin_image, stub_model(Admin::Image,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
