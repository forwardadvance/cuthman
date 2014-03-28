require 'spec_helper'

describe "admin/images/edit" do
  before(:each) do
    @admin_image = assign(:admin_image, stub_model(Admin::Image,
      :title => "MyString"
    ))
  end

  it "renders the edit admin_image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_image_path(@admin_image), "post" do
      assert_select "input#admin_image_title[name=?]", "admin_image[title]"
    end
  end
end
