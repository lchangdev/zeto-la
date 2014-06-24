class Launcher < ActiveRecord::Base
  validates :address, presence: true
  geocoded_by :address

  after_validation :geocode, if: :address_changed?

  belongs_to :user
end
