# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.create(email: 'aboumalicksacko@gmail.com',
			password: 'Bismilahi95',
			password_confirmation: 'Bismilahi95',
			name: 'Aboumalicksacko',
			role: User.roles[:admin])
User.create(email: 'sacko202@gmail.com',
			password: 'Bismilahi95',
			password_confirmation: 'Bismilahi95',
			name: 'Sacko202')

10.times do |x|
	blog = Blog.create(title: "Title #{x}",
		               body: "Body #{x} words go here Idk",
		               user_id: User.first.id)
end