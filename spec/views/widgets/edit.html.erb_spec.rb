require 'spec_helper'

describe "widgets/edit" do
  before(:each) do
    @widget = assign(:widget, stub_model(Widget,
      :page_id => 1,
      :template_location => "MyString",
      :resource_id => 1,
      :resource_type => "MyString"
    ))
  end

  it "renders the edit widget form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", widget_path(@widget), "post" do
      assert_select "input#widget_page_id[name=?]", "widget[page_id]"
      assert_select "input#widget_template_location[name=?]", "widget[template_location]"
      assert_select "input#widget_resource_id[name=?]", "widget[resource_id]"
      assert_select "input#widget_resource_type[name=?]", "widget[resource_type]"
    end
  end
end
