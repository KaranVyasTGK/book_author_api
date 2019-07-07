class Api::BooksController < Api::BaseController

	api :GET, '/books', 'Return list of all Books'
	param :auth_token, String, 'Pass auth_token in the header for the logged in user', required: true
	def index
		@books = Book.all
		json_response("List of Books", true, @books, :ok)
	end

	api :GET, '/search', 'Return Search Result or Nil'
	param :query, String, desc: "Element on the basis we want to perform search", required: false
	param :auth_token, String, 'Pass auth_token in the header for the logged in user & it is required', required: false
	def search
		@books = Book.joins(:author).search(params[:query])
		if @books.present?
			json_response("Search Result", true, @books, :ok)
		else
			json_response("No Books Found", true, {}, :ok)
		end
	end

end


