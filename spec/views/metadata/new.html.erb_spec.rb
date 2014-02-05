require 'spec_helper'

describe "metadata/new" do
  before(:each) do
    assign(:metadatum, stub_model(Metadatum,
      :page_id => 1,
      :title => "MyString",
      :description => "MyText",
      :keywords => "MyText",
      :og_title => "MyString",
      :og_description => "MyText",
      :primary_widget_id => 1
    ).as_new_record)
  end

  it "renders new metadatum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", metadata_path, "post" do
      assert_select "input#metadatum_page_id[name=?]", "metadatum[page_id]"
      assert_select "input#metadatum_title[name=?]", "metadatum[title]"
      assert_select "textarea#metadatum_description[name=?]", "metadatum[description]"
      assert_select "textarea#metadatum_keywords[name=?]", "metadatum[keywords]"
      assert_select "input#metadatum_og_title[name=?]", "metadatum[og_title]"
      assert_select "textarea#metadatum_og_description[name=?]", "metadatum[og_description]"
      assert_select "input#metadatum_primary_widget_id[name=?]", "metadatum[primary_widget_id]"
    end
  end
end
