class Institution < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :url, presence: true, length: { maximum: 255 },
                  format: /\A#{URI.regexp(['http', 'https'])}\z/,
                  uniqueness: { case_sensitive: false }
  validates :location, presence: true
  validates :kind, presence: true
  
  has_many :institutionmicroposts
  has_many :users, through: :institutionmicroposts
end
