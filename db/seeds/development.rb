# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


  abdoulaziz = User.first_or_create!(email: 'aboumalicksacko@gmail.com',
                     password: 'Bismilahi95',
                     password_confirmation: 'Bismilahi95',
                     first_name: 'AbdoulAziz',
                     last_name: 'Sacko',
                     role: User.roles[:admin])

  abdoulkader = User.first_or_create!(email: 'sacko202@gmail.com',
                     password: 'Bismilahi95',
                     password_confirmation: 'Bismilahi95',
                     first_name: 'AbdoulKader',
                     last_name: 'Sacko')


  Address.first_or_create!(street: '123 Main St',
                 city: 'Anytown',
                 state: 'CA',
                 zip: '12345',
                 country: 'USA',
                 user: User.first)
  Address.first_or_create!(street: '123 Main St',
                 city: 'Anytown',
                 state: 'CA',
                 zip: '12345',
                 country: 'USA',
                 user: User.second)

  category = Category.first_or_create!(name: 'Uncategorized', display_in_nav: true)
  Category.first_or_create!(name: 'General', display_in_nav: true)
  Category.first_or_create!(name: 'Finance', display_in_nav: true)
  Category.first_or_create!(name: 'Health', display_in_nav: false)
  Category.first_or_create!(name: 'Education', display_in_nav: false)


elapsed = Benchmark.measure do
  blogs = []
  10.times do |x|
    puts "Creating blogs #{x}"
    blog = Blog.new(title: "Title #{x}",
                    body: "Body #{x} Words go here Idk",
                    user: abdoulaziz,
                    category: category)

    5.times do |y|
      puts "Creating comment #{y} for blog #{x}"
      blog.comments.build(body: "Comment #{y}",
                          user: abdoulaziz)
    end
    blogs.push(blog)
  end
  Blog.import(blogs, recursive: true)
end


puts "Seeded development DB in #{elapsed.real} seconds"
