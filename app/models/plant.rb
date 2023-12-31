class Plant < ApplicationRecord
  validates :image, :name, :description, :start_date, presence: true
  validates :name, length: { maximum: 15, message: "は15文字以内です。" }
  validates :description, length: { maximum: 500, message: "は500文字以内です。"}

  has_one_attached :image
  belongs_to :user
  has_many :care_records, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
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
