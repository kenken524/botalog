class Plant < ApplicationRecord
  validates :image, :name, :description, :start_date, presence: true

  has_one_attached :image
  belongs_to :user
end
