class Message < ApplicationRecord
  validates :body, presence: true, length: { maximum: 200, message: "は200文字以内です。" }

  belongs_to :user
  belongs_to :room
end
