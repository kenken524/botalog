class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password, presence: true, on: :create
  validates :image, :nickname, :profile, presence: true

  has_many :plants, dependent: :destroy
  has_many :care_records, through: :plants, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  #画像添付
  has_one_attached :image

  #メッセージ関連
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  #いいね関連
  has_many :likes, dependent: :destroy
  has_many :liked_plants, through: :likes, source: :likable, source_type: 'Plant'
  has_many :liked_care_records, through: :likes, source: :likable, source_type: 'CareRecord'

  #フォロー関連
  has_many :follower_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :followed_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :followed_relationships, source: :followed

  def follow(user)
    following << user
  end

  def unfollow(user)
    following.delete(user)
  end

  def following?(user)
    following.include?(user)
  end

  #検索用
  def self.search(search)
    if search != ""
      User.where('nickname LIKE(?)', "%#{search}%")
    else
      User.all.order('created_at DESC')
    end
  end
end
