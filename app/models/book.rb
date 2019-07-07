class Book < ApplicationRecord
  belongs_to :author
  has_many :reviews

  enum genre: ["Science fiction","Satire","Drama","Action and Adventure","Romance","Mystery","Horror","Self help", "Fantasy"]

  scope :search, -> (args) { where(
  	'books.name LIKE :search OR 
	s_description LIKE :search OR 
	l_description LIKE :search OR 
	genre = :genre_search OR
	authors.name LIKE :search', search: "%#{args}%", genre_search: Book.genres[args]
  	)}
end

