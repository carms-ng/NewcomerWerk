require 'faker'

puts "seeding"

User.destroy_all
Service.destroy_all
Booking.destroy_all
Review.destroy_all

20.times do
  user = User.create(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456',
    location: ['Montreal', 'Toronto', 'Vancouver'].sample)

  rand(1..10).times do
    service = Service.new(title: Faker::Hipster.word,description: Faker::Hacker.say_something_smart,
      rate: rand(10..300), years_experience: rand(1..7))
    service.user = user
    service.save
  end
end

services = Service.all

services.each do
  (1..5)

puts "Seeding done!"

