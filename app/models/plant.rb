class Plant < ApplicationRecord
  validates :image, :name, :description, :start_date, presence: true

  has_one_attached :image
  belongs_to :user
  has_many :care_records
  has_many :comments, as: :commentable
  has_many :likes, as: :likable, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  def self.search(search)
    if search != ""
      Plant.where('name LIKE(?)', "%#{search}%")
    else
      Plant.includes(:user).order('created_at DESC')
    end
  end
end
