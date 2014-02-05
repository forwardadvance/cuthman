require 'spec_helper'

describe "metadata/show" do
  before(:each) do
    @metadatum = assign(:metadatum, stub_model(Metadatum,
      :page_id => 1,
      :title => "Title",
      :description => "MyText",
      :keywords => "MyText",
      :og_title => "Og Title",
      :og_description => "MyText",
      :primary_widget_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Og Title/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
  end
end
