class User < ApplicationRecord
	has_secure_password

	def generate_token
		update(:auth_token => SecureRandom.hex(10))
	end

	def as_json(opt={})
		{
			email: email,
			auth_token: auth_token
		}
	end

end
