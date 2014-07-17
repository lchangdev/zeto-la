class Post < ActiveRecord::Base
  validates :title, presence: true, length: {maximum: 60}
  validates :description, presence: true
  validates :date, presence: true
  validates :user_id, presence: true

  belongs_to :author, foreign_key: 'user_id', class_name: "user"
  has_many :users, through: :members
  has_many :members, dependent: :destroy

  geocoded_by :address

  after_validation :geocode, if: :address_changed?
end
