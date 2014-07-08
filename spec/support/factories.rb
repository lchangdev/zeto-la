FactoryGirl.define do
  factory :user do
    provider 'facebook'
    uid '1234567'
    name 'Joe Bloggs'
    image 'http://graph.facebook.com/1234567/picture?type=square'
    sequence(:email) {|n| "joe#{n}@bloggs.com"}
    oauth_token 'ABCDEF'
    oauth_expires_at '2011-11-11T06:21:03'
    address '1234 Main St. Boston, MA. 11111'
    cohort 'Summer 2014'
    company_name 'Launch Academy'
    confirmation true
  end
end
