class Recommend < ActiveRecord::Base
  validates :title,
  presence: true,
  length: { maximum: 140 }
  validates :user_id, presence: true
  belongs_to :user
  has_many :likes, dependent: :destroy
end
