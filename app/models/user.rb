class User < ActiveRecord::Base
  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: {scope: :provider}
  validates :name, presence: true
  validates :image, presence: true
  validates :email, presence: true
  validates :oauth_token, presence: true
  validates :oauth_expires_at, presence: true

  belongs_to :launcher

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.image = auth.info.image
      user.email = auth.info.email
      user.location = auth.info.location
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
