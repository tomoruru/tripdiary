class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  
  has_secure_password
  
  has_many :trips
  has_many :favorites
  has_many :favorite_trips, through: :favorites, source: :trip
  
  def favorite(trip)
    self.favorites.find_or_create_by(trip_id: trip.id)
  end
  
  def unfavorite(trip)
    favorite = self.favorites.find_or_create_by(trip_id: trip.id)
    favorite.destroy if favorite
  end
  
  def favorite?(trip)
    self.favorite_trips.include?(trip)
  end
end
