# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a main sample user.
User.create!(email: "rad@example.com",
             mobile:  "0401000000",
             name: "RAD",
             password:              "Rails2020",
             password_confirmation: "Rails2020")

# Generate a bunch of additional users.
11.times do |n|
    mobile = "0401000000"
    email = "example-#{n+1}@example.com"
    name = Faker::Lorem.sentence(word_count: 1)
    password = "000000000"
    User.create!(mobile:  mobile,
                 email: email,
                 name: name,
                 password:              password,
                 password_confirmation: password)
  end

# Generate posts for a subset of users.
users = User.order(:created_at).take(5)
3.times do
    title = Faker::Lorem.sentence(word_count: 5)
    topic = "Rails"
    content = Faker::Lorem.sentence(word_count: 50)
    view = 1000
    users.each { |user| user.posts.create!(title:  title,
                                            topic: topic,
                                            content: content,
                                            view: view) }
    end

Post.create!(title: Faker::Lorem.sentence(word_count: 10),
             content:Faker::Lorem.sentence(word_count: 300),
             topic: "Rails",
             view:5,
             user_id:2,
             created_at: "2019-05-07 06:55:15")

Post.create!(title: Faker::Lorem.sentence(word_count: 10),
             content:Faker::Lorem.sentence(word_count: 200),
             topic: "A.I.",
             view:4,
             user_id:3,
             created_at: "2020-04-20 06:55:15")       

Post.create!(title: Faker::Lorem.sentence(word_count: 10),
             content:Faker::Lorem.sentence(word_count: 150),
             topic: "Rails",
             view:3,
             user_id:4,
             created_at: "2020-02-07 06:55:15")  

Post.create!(title: Faker::Lorem.sentence(word_count: 10),
             content:Faker::Lorem.sentence(word_count: 200),
             topic: "A.I.",
             view:2,
             user_id:5,
             created_at: "2020-05-06 07:12:09")

Post.create!(title: Faker::Lorem.sentence(word_count: 10),
             content:Faker::Lorem.sentence(word_count: 200),
             topic: "Rails",
             view:1,
             user_id:6,
             created_at: "2020-04-17 08:55:15")       

Post.create!(title: Faker::Lorem.sentence(word_count: 10),
             content:Faker::Lorem.sentence(word_count: 300),
             topic: "A.I.",
             view:0,
             user_id:7,
             created_at: "2020-04-27 06:55:15") 

Post.create!(title: Faker::Lorem.sentence(word_count: 10),
             content:Faker::Lorem.sentence(word_count: 200),
             topic: "Vue",
             view:0,
             user_id:8,
             created_at: "2019-05-07 12:30:26")

Post.create!(title: Faker::Lorem.sentence(word_count: 10),
             content:Faker::Lorem.sentence(word_count: 150),
             topic: "A.I.",
             view:201,
             user_id:1,
             created_at: "2020-05-03 19:20:22")       

Post.create!(title: Faker::Lorem.sentence(word_count: 10),
             content:Faker::Lorem.sentence(word_count: 250),
             topic: "Rails",
             view:39,
             user_id:3,
             created_at: "2020-03-26 06:55:15") 

Post.create!(title: Faker::Lorem.sentence(word_count: 10),
             content:Faker::Lorem.sentence(word_count: 150),
             topic: "AWS",
             view:0,
             user_id:2,
             created_at: "2020-01-03 06:55:15")

Post.create!(title: Faker::Lorem.sentence(word_count: 10),
             content:Faker::Lorem.sentence(word_count: 130),
             topic: "Web",
             view:0,
             user_id:3,
             created_at: "2020-04-07 06:55:15")       

Post.create!(title: Faker::Lorem.sentence(word_count: 10),
             content:Faker::Lorem.sentence(word_count: 150),
             topic: "Game",
             view:0,
             user_id:1,
             created_at: "2020-05-01 16:55:15") 

Post.create!(title: Faker::Lorem.sentence(word_count: 10),
             content:Faker::Lorem.sentence(word_count: 150),
             topic: "A.I.",
             view:17,
             user_id:7,
             created_at: "2020-05-01 16:55:15") 
                                