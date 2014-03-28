# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :login do
    user_id 1
    session_key "MyString"
    expires "2014-03-27 23:01:05"
  end
end
