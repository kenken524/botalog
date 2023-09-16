class CareRecord < ApplicationRecord
  validates :image, :description, :care_date, presence: true

  has_one_attached :image
  belongs_to :user
  belongs_to :plant
  has_many :comments, as: :commentable
end
