class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :user_id, presence: true

  belongs_to :user

  geocoded_by :address

  after_validation :geocode, if: :address_changed?
end
