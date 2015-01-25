class TagType < ActiveRecord::Base
	validates :tag_type_name, uniqueness: true, null: false

	has_many :tags
	has_many :gift_requests, through: :tags, source: :gift_request
end
