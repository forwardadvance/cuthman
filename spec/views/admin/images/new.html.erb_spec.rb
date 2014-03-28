require 'spec_helper'

describe "admin/images/new" do
  before(:each) do
    assign(:admin_image, stub_model(Admin::Image,
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new admin_image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_images_path, "post" do
      assert_select "input#admin_image_title[name=?]", "admin_image[title]"
    end
  end
end
