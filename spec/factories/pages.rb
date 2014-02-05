# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    sequence(:slug) { |n| "page_#{n}" }
    template "Article"
    metadata_id 1
  end
end
