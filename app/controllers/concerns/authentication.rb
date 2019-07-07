module Authentication
	def current_user
	  auth_token = request.headers["AUTH-TOKEN"]
	  return unless auth_token
	  @current_user = User.find_by auth_token: auth_token
	end

	def authenticate_with_token!
	  return if current_user
	  render json: {message: "Unauthorized User", data: "" }
	end

end