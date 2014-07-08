FactoryGirl.define do
  factory :user do
    trait :with_id do
        sequence(:id) {|n| n}
    end
    provider 'facebook'
    sequence(:uid) {|n| "#{n*1234567}"}
    name %w[Joe Bloggs, John Snow, John Joe,].sample
    image 'http://graph.facebook.com/1234567/picture?type=square'
    sequence(:email) {|n| "joe#{n}@bloggs.com"}
    oauth_token 'ABCDEF'
    oauth_expires_at '2011-11-11T06:21:03'
    trait :with_address do
        sequence(:address) {|n| "#{n} Main St. Boston, MA. 11111"}
    end
    trait :with_cohort do
        cohort 'Summer 2014'
    end
    company_name 'Launch Academy'
    confirmation true
  end
end
