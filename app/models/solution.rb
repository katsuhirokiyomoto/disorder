class Solution < ApplicationRecord
  belongs_to :problemmicropost
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'
  
  validates :problemmicropost_id, presence: true
  validates :follower_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 500 }
  
  
end
