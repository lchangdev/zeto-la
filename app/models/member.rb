class Member < ActiveRecord::Base
  validates :user_id, presence: true
  validates :post_id, presence: true, uniqueness: {scope: :user}

  belongs_to :user
  belongs_to :post
end
