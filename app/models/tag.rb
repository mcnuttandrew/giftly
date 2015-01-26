class Tag < ActiveRecord::Base
	validates :tag_type_id, null: false
	validates :request_id, null: false

	belongs_to :gift_request, class_name: "GiftRequest", foreign_key: :request_id
	belongs_to :tag_type
end
