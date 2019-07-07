class Api::SessionsController < Api::BaseController
	skip_before_action :authenticate_with_token! ,only: [:create]

	api :POST, '/login', 'Return Auth token & email'
	param :user, Hash, desc: "Validate Email and Password of user" do
		param :email, String, :desc => "Username for login", :required => true
    param :password, String, :desc => "Password for login", :required => true
	end
	def create
		user = User.find_by_email(user_params[:email])
		if user && user.authenticate(user_params[:password])
			user.generate_token
			json_response("Login Success", true, user, :ok)
		else
			json_response("Email or password is incorrect", false, {}, :unauthorized)
		end
	end


	api :POST, '/logout', 'Logout user and Returnuser object with null token'
	param :auth_token, String, 'Pass auth_token in the header for the logged in user & it is required', required: false
	def destroy
		user = current_user
		user.update(:auth_token => nil)
		json_response("Logout Success", true, user, :ok)
	end


	private
		def user_params
			params.require(:user).permit(:email, :password)
		end
end
