require 'spec_helper'

describe "widgets/new" do
  before(:each) do
    assign(:widget, stub_model(Widget,
      :page_id => 1,
      :template_location => "MyString",
      :resource_id => 1,
      :resource_type => "MyString"
    ).as_new_record)
  end

  it "renders new widget form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", widgets_path, "post" do
      assert_select "input#widget_page_id[name=?]", "widget[page_id]"
      assert_select "input#widget_template_location[name=?]", "widget[template_location]"
      assert_select "input#widget_resource_id[name=?]", "widget[resource_id]"
      assert_select "input#widget_resource_type[name=?]", "widget[resource_type]"
    end
  end
end
