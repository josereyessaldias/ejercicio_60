class Collection < ApplicationRecord
	has_many :activity_collection, dependent: :destroy
	has_many :activities, through: :activity_collection, dependent: :destroy
	mount_uploader :photo, ImageUploader

	has_many :user_collection, dependent: :destroy
	has_many :users, through: :user_collection, dependent: :destroy

	belongs_to :user, class_name: 'User', foreign_key: :owner_id
end
