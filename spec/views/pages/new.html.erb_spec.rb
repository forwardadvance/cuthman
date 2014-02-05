require 'spec_helper'

describe "pages/new" do
  before(:each) do
    assign(:page, stub_model(Page,
      :slug => "MyString",
      :parent_id => 1,
      :template_id => 1,
      :metadata_id => 1
    ).as_new_record)
  end

  it "renders new page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pages_path, "post" do
      assert_select "input#page_slug[name=?]", "page[slug]"
      assert_select "input#page_parent_id[name=?]", "page[parent_id]"
      assert_select "input#page_template_id[name=?]", "page[template_id]"
      assert_select "input#page_metadata_id[name=?]", "page[metadata_id]"
    end
  end
end
