require 'spec_helper'

describe "admin/images/index" do
  before(:each) do
    assign(:admin_images, [
      stub_model(Admin::Image,
        :title => "Title"
      ),
      stub_model(Admin::Image,
        :title => "Title"
      )
    ])
  end

  it "renders a list of admin/images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
