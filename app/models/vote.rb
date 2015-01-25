class Vote < ActiveRecord::Base
	validates :gift_response_id, null: false
	validates :voter_id, null: false


	belongs_to :voter, class_name: "User", foreign_key: :voter_id
	belongs_to :gift_response
	belongs_to :gift_request, through: :gift_response, source: :gift_request
	belongs_to :voted_user, through: :gift_response, source: :user
end
