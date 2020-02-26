require 'faker'

puts "seeding"

User.destroy_all
Service.destroy_all
Booking.destroy_all
Review.destroy_all

Marion = User.create(first_name: 'Marion', last_name: 'Cotillard',
  email: 'marion.cotillard@gmail.com', password:'123456', location: 'Paris')

Morgan = User.create(first_name: 'Morgan', last_name: 'Freeman',
  email: 'morgan.freeman@hotmail.com', password: '123456', location: 'Memphis')

Jamie = User.create(first_name: 'Jamie', last_name: 'Chung',
  email: 'jamie.chung@gmail.com', password:'123456', location: 'San Francisco')

Penelope = User.create(first_name: 'Penelope', last_name: 'Cruz',
  email: 'penelope.cruz@gmail.com', password:'123456', location: 'Madrid')

Priyanka = User.create(first_name: 'Priyanka', last_name: 'Chopra',
  email: 'priyanka.chopra@gmail.com', password: '123456', location: 'Jamshedpur')

Midwife = Service.new(title: 'Experimented Midwife', description: 'As a practicing midwife and technical
  advisor on global health programs, I have met midwives throughout Africa, Southeast Asia, and beyond in very
  low-resource settings and challenging circumstances, working hard every day to ensure women and newborns receive
  the high-quality care they deserve.', rate: 100, years_experience: 20)

Lifecoach = Service.new(title: 'Life Coach with a lot of experience', description: 'I AM Life Coaching
Corporate and Personal Life Coaching
Empowering holistic healing and corporate wellness.
They say that Leaders are born, not made. But with the right Life Coach true leaders are awakened to walk their journey!',
rate: 150, years_experience: 5 )

Midwife.user = Priyanka
Midwife.save

Lifecoach.user = Morgan
Lifecoach.save


20.times do
  user = User.create(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456',
    location: ['Montreal', 'Toronto', 'Vancouver'].sample)

  rand(1..10).times do
    service = Service.new(title: Faker::Job.field ,description: Faker::Hacker.say_something_smart,
      rate: rand(10..300), years_experience: rand(1..7))
    service.user = user
    service.save
  end
end


puts "Seeding done!"

