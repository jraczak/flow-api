class Message
	def self.not_found(record = 'record')
		"Sorry, #{record} was not found."
	end

	def self.invalid_credentials
		'Invalid credentials'
	end

	def self.invalid_token
		'Missing token'
	end

	def self.unauthroized
		'Unathorized request'
	end

	def self.account_created
		'Account created successfully'
	end

	def self.account_not_created
		'Account could not be created'
	end

	def self.expired_token
		'Sorry, your session has expired. Please login again to continue'
	end