class Author < ApplicationRecord
	has_many :books
	has_one_attached :profile_pic

	validates :bio, length: { in: 6..50 }
end
