class Problemmicropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 500 }
  
  has_many :solutions, :dependent => :destroy
  has_many :followers, through: :solutions, source: :follower
  
end
