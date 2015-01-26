class GiftRequest < ActiveRecord::Base

	validates :user_id, null: false
	validates :title, null: false
	validates :description, null: false

	belongs_to :user
	has_many :gift_responses
	has_one :request_checklist
	has_many :flags
	has_many :associated_votes, through: :gift_responses, source: :votes
	has_many :tags, class_name: "Tag", foreign_key: :request_id
	has_many :tag_name_objects, through: :tags, source: :tag_type
end
