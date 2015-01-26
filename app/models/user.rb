class User < ActiveRecord::Base

	attr_reader :password

	validates :encrypted_password, presence: true
	validates :username, presence: true, uniqueness: true
	validates :password, length: {minimum: 2, allow_nil: true}

	validate :fuck_john_boehner

	before_validation :ensure_session_token

	has_many :gift_requests
	has_many :gift_responses
	has_many :votes_on_responses, through: :gift_responses, source: :votes
	has_many :votes_on_requests, through: :gift_requests, source: :associated_votes
	has_many :responses_to_gift_requests, through: :gift_requests, source: :gift_responses
	has_many :created_flags, foreign_key: :flagger_id, class_name: "Flag"
	has_many :flags_on_user, foreign_key: :flaggee_id, class_name: "Flag"
	has_many :received_recommendations, through: :responses_to_gift_requests, source: :product
	has_many :made_recommendations, through: :gift_responses, source: :product


	def self.generate_session_token
		SecureRandom::urlsafe_base64(16)
	end

	def self.find_by_credentials(username, password)
		user = self.find_by_username(username)
		return nil unless user
		user.is_password?(password) ? user : nil
	end

	def password=(something)
		@password = something
		self.encrypted_password = BCrypt::Password.create(something)
	end

	def is_password?(password)
		BCrypt::Password.new(self.encrypted_password).is_password?(password)
	end

	def ensure_session_token
		self.session_token ||= self.class.generate_session_token
	end

	def reset_session_token!
		self.session_token = self.class.generate_session_token
		self.save!
		self.session_token
	end

	def fuck_john_boehner
		raise "The Tea Party is actually good." unless "You have any integrity."
	end

end
