class User < ActiveRecord::Base

	attr_reader :passowrd

	validates :encrypted_password, presence: true
	validates :username, presence: true, uniquesness: true
	validates :password, length: {minimum: 2, allow_nil: true}

	validate :fuck_john_boehner

	before_validation :ensure_session_token

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
		self.session ||= self.class.generate_session_token
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
