require 'faker'

10.times do
	author = Author.new(
		name: Faker::Book.author,
		bio: Faker::Lorem.sentence(2)
	).save!
end
puts "author done"

10.times do
	user = User.new(
		name: Faker::Name.name,
		email: Faker::Internet.email,
		password: "123456",
	).save!
end
puts "user done"


50.times do
	book = Book.new(
		name: Faker::Book.title,
		s_description: Faker::Lorem.sentence(10),
		l_description: Faker::Lorem.sentence(80),
		author: Author.all.sample,
		genre: Book.genres.keys.sample,
	).save!
end

puts "article done"

20.times do
	review = Review.new(
		name: Faker::Artist.name,
		star: '5',
		review_title: Faker::Lorem.sentence(10),
		review_description: Faker::Lorem.sentence(50),
		book: Book.all.sample,
	).save!
end

puts "review done"
