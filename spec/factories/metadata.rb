# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :metadatum do
    page_id 1
    title "MyString"
    description "MyText"
    keywords "MyText"
    og_title "MyString"
    og_description "MyText"
    primary_widget_id 1
  end
end
