class CareRecord < ApplicationRecord
  validates :image, :description, :care_date, presence: true

  has_one_attached :image
  belongs_to :user
  belongs_to :plant
  has_many :comments, as: :commentable
  has_many :likes, as: :likable, dependent: :destroy

  def self.search(search)
    if search.present?
      joins(:plant).where('plants.name LIKE ?', "%#{search}%")
    else
      includes(:plant).order('created_at DESC')
    end
  end
end
