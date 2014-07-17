FactoryGirl.define do
  factory :post do
    sequence(:title) {|n| "example title #{n}"}
    sequence(:description) {|n| "example description #{n}"}
    date "01/01/14"

    association :author, factory: :user
  end
end
