class GiftResponse < ActiveRecord::Base

	attr_accessor :user_id, :gift_request_id, :response_body

	validates :gift_request_id, null: false
	validates :user_id, null: false
	validates :response_body, null: false
	validate :do_not_answer_your_own_question

	belongs_to :user
	belongs_to :gift_request
	has_one :request_asking_user, through: :gift_request, source: :user
	has_many :flags
	has_many :votes
	has_one :product


	def do_not_answer_your_own_question
		raise "there is a problem" if user_id == GiftRequest.find(gift_request_id).user.id
	end

end
