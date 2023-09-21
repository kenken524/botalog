class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password, presence: true, on: :create
  validates :image, :nickname, :profile, presence: true

  has_one_attached :image
  has_many :plants
  has_many :care_records, through: :plants
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_plants, through: :likes, source: :likable, source_type: 'Plant'
  has_many :liked_care_records, through: :likes, source: :likable, source_type: 'CareRecord'
  has_many :bookmarks, dependent: :destroy

  has_many :follower_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :followed_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :followed_relationships, source: :followed

  def self.search(search)
    if search != ""
      User.where('nickname LIKE(?)', "%#{search}%")
    else
      User.all.order('created_at DESC')
    end
  end

  def follow(user)
    following << user
  end

  def unfollow(user)
    following.delete(user)
  end

  def following?(user)
    following.include?(user)
  end
end
