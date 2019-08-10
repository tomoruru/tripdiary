class Trip < ApplicationRecord
  belongs_to :user
  validates :where , presence: true
  validates :where, :transpotation, :hotel, :what_did, length: { maximum: 1000}
  mount_uploader :image, ImageUploader
end
