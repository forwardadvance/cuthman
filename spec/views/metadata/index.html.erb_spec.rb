require 'spec_helper'

describe "metadata/index" do
  before(:each) do
    assign(:metadata, [
      stub_model(Metadatum,
        :page_id => 1,
        :title => "Title",
        :description => "MyText",
        :keywords => "MyText",
        :og_title => "Og Title",
        :og_description => "MyText",
        :primary_widget_id => 2
      ),
      stub_model(Metadatum,
        :page_id => 1,
        :title => "Title",
        :description => "MyText",
        :keywords => "MyText",
        :og_title => "Og Title",
        :og_description => "MyText",
        :primary_widget_id => 2
      )
    ])
  end

  it "renders a list of metadata" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Og Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
