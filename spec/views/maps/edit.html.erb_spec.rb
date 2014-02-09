require 'spec_helper'

describe "maps/edit" do
  before(:each) do
    @map = assign(:map, stub_model(Map,
      :lat => 1,
      :lng => 1,
      :zoom => 1,
      :type => ""
    ))
  end

  it "renders the edit map form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", map_path(@map), "post" do
      assert_select "input#map_lat[name=?]", "map[lat]"
      assert_select "input#map_lng[name=?]", "map[lng]"
      assert_select "input#map_zoom[name=?]", "map[zoom]"
      assert_select "input#map_type[name=?]", "map[type]"
    end
  end
end
