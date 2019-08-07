class Trip < ApplicationRecord
  belongs_to :user
  
  validates :where, :transpotation, :hotel, :what_did, length: { maximum: 300}
  mount_uploader :image, ImageUploader
end
