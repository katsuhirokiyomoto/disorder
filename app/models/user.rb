class User < ApplicationRecord
  before_save {self.email.downcase!}
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: {case_sensitive: false }
  has_secure_password
  
  has_many :itemrelationships
  has_many :items, through: :itemrelationships, source: :item
  has_many :institutionmicroposts
  has_many :institutions, through: :institutionmicroposts
  has_many :problemmicroposts
  has_many :solutions, foreign_key: 'follower_id'
  
  
  def recommend(item)
    self.itemrelationships.find_or_create_by(item_id: item.id)
  end
  
  def unrecommend(item)
    itemrelationship=self.itemrelationships.find_by(item_id: item.id)
    itemrelationship.destroy if itemrelationship
  end
  
  def recommend?(item)
    self.items.include?(item)
  end
  
  def solve?(problemmicropost)
    solution=self.solutions.find_by(problemmicropost_id: problemmicropost.id)
    if solution
      return true
    else
      return false
    end
  end
  
end
