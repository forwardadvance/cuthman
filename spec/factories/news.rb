# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news do
    title "MyString"
    intro "MyText"
    content "MyText"
  end
end
