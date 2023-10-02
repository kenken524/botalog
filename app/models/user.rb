# frozen_string_literal: true

class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Validations
  validates :password, presence: true, on: :create
  validates :image, :nickname, :profile, presence: true
  validates :profile, length: { maximum: 100, message: "は100文字以内です。" }
  validates :nickname, length: { maximum: 12, message: "は12文字以内です。" }
  validate :password_complexity

  # Associations
  has_many :plants, dependent: :destroy
  has_many :care_records, through: :plants, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  # Image attachment
  has_one_attached :image

  # Message associations
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  # Like associations
  has_many :likes, dependent: :destroy
  has_many :liked_plants, through: :likes, source: :likable, source_type: 'Plant'
  has_many :liked_care_records, through: :likes, source: :likable, source_type: 'CareRecord'

  # Follow associations
  has_many :follower_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :followed_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :followed_relationships, source: :followed

  # Follow methods
  def follow(user)
    following << user
  end

  def unfollow(user)
    following.delete(user)
  end

  def following?(user)
    following.include?(user)
  end

  # Search method
  def self.search(search)
    if search.present?
      where('nickname LIKE ?', "%#{search}%")
    else
      all.order(created_at: :desc)
    end
  end

  private

  def password_complexity
    return if password.blank?

    return if password.match(/\A(?:[0-9]+|[a-zA-Z]+)\z/)
      errors.add :password, 'は半角英数字のどちらかを含む形式で入力してください'
    
  end
end
