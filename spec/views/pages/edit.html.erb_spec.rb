require 'spec_helper'

describe "pages/edit" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :slug => "MyString",
      :parent_id => 1,
      :template_id => 1,
      :metadata_id => 1
    ))
  end

  it "renders the edit page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", page_path(@page), "post" do
      assert_select "input#page_slug[name=?]", "page[slug]"
      assert_select "input#page_parent_id[name=?]", "page[parent_id]"
      assert_select "input#page_template_id[name=?]", "page[template_id]"
      assert_select "input#page_metadata_id[name=?]", "page[metadata_id]"
    end
  end
end
