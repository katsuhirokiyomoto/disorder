class Institutionmicropost < ApplicationRecord
  belongs_to :user
  belongs_to :institution
  
  validates :content, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true
  validates :institution_id, presence: true
end
