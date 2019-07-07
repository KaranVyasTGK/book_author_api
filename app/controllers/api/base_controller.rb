class Api::BaseController < ActionController::API
	before_action :authenticate_with_token!
	include Response
	include Authentication
end