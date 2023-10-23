
require 'faker'

# require 'faker'
puts "Loading..."
# puts "Deleting existing data..."
# Pair.destroy_all
# Student.destroy_all
# User.destroy_all
# Instructor.destroy_all
# Feedback.destroy_all
# Message.destroy_all

# puts "Creating new data..."
# # Create 10 users with random roles (either 'student' or 'instructor')
# 10.times do
#   role = ['student', 'admin'].sample
#   User.create(
#     fullname: Faker::Name.name,
#     email: Faker::Internet.email,
#     password: 'password',
#     role: role
#   )
# end

# # Create 5 instructors, each associated with a user
# 5.times do
#   user = User.where(role: 'instructor').sample
#   Instructor.create(
#     user_id: user.id,
#     name: user.full_name,
#     email: user.email
#   )
# end

# # Create 10 random pairs for week 1
# students = Student.all.sample(10)
# pairs = students.each_slice(2).to_a
# pairs << [students.last, Student.all.sample]
# pairs.each do |pair|
#   Pair.create(
#     week_no: 1,
#     student1_id: pair[0].id,
#     student2_id: pair[1].id
#   )
# end

# # Generate feedback for each pair
# Pair.all.each do |pair|
#   Feedback.create(
#     user_id: pair.student1.user_id,
#     instructor_id: Instructor.all.sample.user_id,
#     comment: Faker::Lorem.paragraph
#   )
#   Feedback.create(
#     user_id: pair.student2.user_id,
#     instructor_id: Instructor.all.sample.user_id,
#     comment: Faker::Lorem.paragraph
#   )
# end

# # Generate some messaging data
# User.all.each do |user|
#   # Send a message to a random recipient
#   Messaging.create(
#     sender_user_id: user.id,
#     recipient_user_id: User.where.not(id: user.id).sample.id,
#     content: Faker::Lorem.paragraph
#   )
# end

# puts "New data created!"

# Create 10 users
# 10.times do
#   User.create(
#     email: Faker::Internet.email,
#     password: Faker::Internet.password
#   )
# end


# User.create!(
#   [
#     { fullname: "John Smith", email: "john.smith@example.com", password: "password123", role: "admin" },
#     { fullname: "Jane Doe", email: "jane.doe@example.com", password: "password456", role: "student" },
#     { fullname: "Mark Johnson", email: "mark.johnson@example.com", password: "password789", role: "admin" },
#     { fullname: "Alice Williams", email: "alice.williams@example.com", password: "password123", role: "student" },
#     { fullname: "Bob Brown", email: "bob.brown@example.com", password: "password456", role: "student" }
#   ]
# )


# Student.create!(
#   fullname: "John Doe",
#   grade: 85,
#   user_id: 2
# )

# Student.create!(
#   fullname: "Jane Smith",
#   grade: 92,
#   user_id: 4
# )

# Student.create!(
#   fullname: "Mark Johnson",
#   grade: 78,
#   user_id: 5
# )
require 'faker'

# puts Seeeddiiingg!!!!
# Create 10 users
# 10.times do
#   User.create(
#     email: Faker::Internet.email,
#     password: Faker::Internet.password
#   )
# end


# Create 50 students, each associated with a random user
50.times do
  Student.create(
    fullname: Faker::Name.name,
    grade: Faker::Base.regexify(/[A-F]/),
    user: User.order("RANDOM()").first
  )
end


puts "Loading done."


