class UserActivity < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  attribute :start, :datetime, default: Time.now
  validates :start, presence: true
  
  validates :user_id, uniqueness: { scope: :activity_id,
    message: "Error" }

   has_many :actuser_photo, dependent: :destroy

   enum status: [:por_hacer, :realizada, :pendiente]

   scope :por_realizar, ->{ where(status: 'por_hacer')}
   scope :realizadas, ->{ where(status: 'realizada')}
   scope :pendientes, ->{ where(status: 'pendiente')}
end
