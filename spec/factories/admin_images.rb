# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_image, :class => 'Admin::Image' do
    title "MyString"
  end
end
