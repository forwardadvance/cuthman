require 'spec_helper'

describe "pages/index" do
  before(:each) do
    assign(:pages, [
      stub_model(Page,
        :slug => "Slug",
        :parent_id => 1,
        :template_id => 2,
        :metadata_id => 3
      ),
      stub_model(Page,
        :slug => "Slug",
        :parent_id => 1,
        :template_id => 2,
        :metadata_id => 3
      )
    ])
  end

  it "renders a list of pages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
