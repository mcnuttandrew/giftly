class Product < ActiveRecord::Base
	validates :title, null: false
	validates :gift_response_id, null: false

	serialize :serialized_json_info

	belongs_to :gift_response
	belongs_to :recommender, through: :gift_response, source: :user
	belongs_to :recommendee, through: :gift_response, source: :request_asking_user


end
