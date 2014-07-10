class User < ActiveRecord::Base
  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: {scope: :provider}
  validates :name, presence: true
  validates :image, presence: true
  validates :email, presence: true
  validates :oauth_token, presence: true
  validates :oauth_expires_at, presence: true

  has_many :contact_requests

  geocoded_by :address

  after_validation :geocode, if: :address_changed?

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.image = auth.info.image
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  # def self.search(search)
  #   if search
  #     all.near(search, 20)
  #   else
  #     scoped
  #   end
  # end
end
