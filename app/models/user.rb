class User < ActiveRecord::Base
  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: {scope: :provider}
  validates :name, presence: true
  validates :image, presence: true
  validates :email, presence: true
  validates :oauth_token, presence: true
  validates :oauth_expires_at, presence: true
  validates :tagline, length: {maximum: 160}

  has_many :contact_requests
  has_many :posts, as: :author, dependent: :destroy
  has_many :posts, through: :members, dependent: :destroy
  has_many :members, dependent: :destroy

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

  def self.cohort
    ['Fall 2013', 'Summer 2013', 'Winter 2013', 'Spring 2014', 'Summer 2014', 'Fall 2014', 'Winter 2014', 'Experience Engineer', 'Launch Staff', 'Hiring Partner']
  end
end
