# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :widget do
    page_id 1
    location "top"
    resource_id 1
    resource_type "News"
  end
end
