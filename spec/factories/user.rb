FactoryGirl.define do
  factory :user do

    provider 'facebook'
    sequence(:uid) {|n| "#{n*1234567}"}
    image 'http://graph.facebook.com/1234567/picture?type=square'
    oauth_token 'ABCDEF'
    oauth_expires_at '2011-11-11T06:21:03'
    company_name 'Launch Academy'
    confirmation true
    sequence(:name) {|n| "John Doe #{n}"}
    sequence(:email) {|n| "joe#{n}@bloggs.com"}
    cohort 'Summer 2014'

    trait :with_id do
      sequence(:id) {|n| n}
    end

    trait :with_address do
      sequence(:address) {|n| "#{n} Main St. Boston, MA. 11111"}
    end
  end
end
