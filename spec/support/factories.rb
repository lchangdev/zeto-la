FactoryGirl.define do
  factory :user do
    provider 'facebook'
    uid '1234567'
    name 'Joe Bloggs'
    image 'http://graph.facebook.com/1234567/picture?type=square'
    email 'joe@bloggs.com'
    oauth_token 'ABCDEF'
    oauth_expires_at '2011-11-11T06:21:03'
  end
end
