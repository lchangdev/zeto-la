module Seeders
  module UserSeeder
    class << self
      def seed
        users.each do |user|
          User.find_or_initialize_by(name: user[:name]) do |u|
            u.provider = user[:provider]
            u.uid = user[:uid]
            u.name = user[:name]
            u.image = user[:image]
            u.email = user[:email]
            u.oauth_token = user[:oauth_token]
            u.oauth_expires_at = user[:oauth_expires_at]
            u.address = user[:address]
            u.longitude = user[:longitude]
            u.latitude = user[:latitude]
            u.cohort = user[:cohort]
            u.save
          end
        end
      end

      def users
        [
          { provider: 'facebook', uid: '11111', name: 'John Snow',
            image: 'http://graph.facebook.com/10204130314839741/picture?type=large',
            email: 'johnsnow@got.com', oauth_token: 'abcde1234', oauth_expires_at: '2011-11-11T06:21:03',
            address: 'Boston, MA', longitude: '-70.7627723', latitude: '42.1719401', cohort: 'Summer 2014'},
          { provider: 'facebook', uid: '22222', name: 'Foo Bar',
            image: 'http://graph.facebook.com/10204130314839741/picture?type=large',
            email: 'johnsnow@got.com', oauth_token: 'abcde1234', oauth_expires_at: '2011-11-11T06:21:03',
            address: 'Medfield, MA', longitude: '-71.3064597', latitude: '42.1875826', cohort: 'Summer 2014'},
          { provider: 'facebook', uid: '33333', name: 'Bob Joe',
            image: 'http://graph.facebook.com/10204130314839741/picture?type=large',
            email: 'johnsnow@got.com', oauth_token: 'abcde1234', oauth_expires_at: '2011-11-11T06:21:03',
            address: 'James Madison University', longitude: '-78.8697548', latitude: '38.435092', cohort: 'Summer 2014'}
        ]
      end
    end
  end
end
