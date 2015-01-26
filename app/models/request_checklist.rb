class RequestChecklist < ActiveRecord::Base
	validates :gift_request_checklist, null: false
	belongs_to :gift_request_checklist
end
