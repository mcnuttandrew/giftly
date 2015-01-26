class Flag < ActiveRecord::Base
	validates :flagger_id, null: false
	validates :flaggee_id, null: false
	validates :flag_type, null: false
	validates :flaggable_id, null: false


	belongs_to :flagger, foreign_key: :flagger_id, class_name: "User"
	belongs_to :flaggee, foreign_key: :flaggee_id, class_name: "User"
end
