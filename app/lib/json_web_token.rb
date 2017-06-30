class JsonWebToken

	HMAC_SECRET = Rails.application.secrets.secret_key_base

	def self.encode(payload, exp = 720.hours.from_now)
		# Set the token to expire in 30 days
		payload[:exp] = exp.to_i
		# Sign the token with the application secret
		JWT.encode(payload, HMAC_SECRET)
	end

	def self.decode(token)
		# Get the payload; first index in decoded array
		body = JWT.decode(token, HMAC_SECRET)[0]
		HashWithIndifferentAccess.new body
		# Resuce from an expiry exception
	rescue JWT::ExpiredSignature, JWT::VerificationError => e
		# raise a custom error to be handled by custom handler
		raise ExceptionHandler::ExpiredSignature, e.message
	end
end

