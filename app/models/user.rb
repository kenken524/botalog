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

end
