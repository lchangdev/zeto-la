class Launcher < ActiveRecord::Base
  validates :address, presence: true

  belongs_to :user
end
