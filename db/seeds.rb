require 'faker'
require "open-uri"


puts "seeding"

User.destroy_all
Service.destroy_all
Booking.destroy_all
Review.destroy_all

file = URI.open('https://fr.web.img6.acsta.net/pictures/16/05/17/11/00/419951.jpg')
Marion = User.create(first_name: 'Marion', last_name: 'Cotillard',
  email: 'marion.cotillard@gmail.com', password:'123456', location: 'Paris', description:"If you're looking to be told I can 10x your business or help you bring in a stream of 'high ticket' clients who are begging to work with you, then you're in the wrong place.I let the people who have never built a coaching practice make such BS claims")
Marion.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')


file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Morgan_Freeman_Deauville_2018.jpg/260px-Morgan_Freeman_Deauville_2018.jpg')
Morgan = User.create(first_name: 'Morgan', last_name: 'Freeman',
  email: 'morgan.freeman@hotmail.com', password: '123456', location: 'Memphis', description: "If you're looking to be told I can 10x your business or help you bring in a stream of 'high ticket' clients who are begging to work with you, then you're in the wrong place.
  I let the people who have never built a coaching practice make such BS claims")
Morgan.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://media1.popsugar-assets.com/files/thumbor/1LFgBBorpx7-MhR0Rpg60ija2jM/fit-in/500x500/filters:format_auto-!!-:strip_icc-!!-/2015/08/03/765/n/1922398/e3d0edd9_edit_img_image_88_1416727419/i/Jamie-Chung.png')
Jamie = User.create(first_name: 'Jamie', last_name: 'Chung',
  email: 'jamie.chung@gmail.com', password:'123456', location: 'San Francisco', description: "If you're looking to be told I can 10x your business or help you bring in a stream of 'high ticket' clients who are begging to work with you, then you're in the wrong place.
  I let the people who have never built a coaching practice make such BS claims")
Jamie.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://d3d127vhjgkwcw.cloudfront.net/images/articles/2020_02/katie-holmes-6001.jpg')
Joanna = User.create(first_name: 'Joanna', last_name: 'Moubta',
  email: 'joanna.moubta@gmail.com', password:'123456', location: 'Toronto', description: "Experienced Midwife with a demonstrated history of working in the medical practice industry, looking to transition into a new career. Skilled in Midwifery,
  Medical office administration including planning and managing budgets, data entry. Strong healthcare services professional with a PCE focused in Adult and Continuing Education and Teaching from Anglia Ruskin University.")
Joanna.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Penelope_Cruz_Cannes_2018.jpg/260px-Penelope_Cruz_Cannes_2018.jpg')
Penelope = User.create(first_name: 'Penelope', last_name: 'Cruz',
  email: 'penelope.cruz@gmail.com', password:'123456', location: 'Madrid', description: "Experienced Midwife with a demonstrated history of working in the medical practice industry, looking to transition into a new career. Skilled in Midwifery, Medical office administration including planning and managing budgets, data entry.
  Strong healthcare services professional with a PCE focused in Adult and Continuing Education and Teaching from Anglia Ruskin University.")
Penelope.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://www.biography.com/.image/t_share/MTMyNzczNjA0ODM5NDUyNjQy/priyanka-chopra-shutterstock_303288878_1290jpg.jpg')
Priyanka = User.create(first_name: 'Priyanka', last_name: 'Chopra',
  email: 'priyanka.chopra@gmail.com', password: '123456', location: 'Jamshedpur', description: "Experienced Midwife with a demonstrated history of working in the medical practice industry,
  looking to transition into a new career. Skilled in Midwifery, Medical office administration including planning and managing budgets, data entry. Strong healthcare services professional with a PCE focused in Adult and Continuing Education and Teaching from Anglia Ruskin University.")
Priyanka.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://images.thestar.com/F0VhDpMu7NB9Waf6wxVcgPEfbL0=/650x650/smart/filters:cb(1548689313694)/https://www.thestar.com/content/dam/thestar/entertainment/television/analysis/2019/01/25/is-this-the-breakout-year-for-asian-men-in-leading-roles/simu_liu.jpg')
Oliver = User.create(first_name: 'Oliver', last_name: 'Nguyen',
  email: 'oliver.nguyen@gmail.com', password: '123456', location: 'Montreal', description: "If you're looking to be told I can 10x your business or help you bring in a stream of 'high ticket' clients who are begging to work with you, then you're in the wrong place.
  I let the people who have never built a coaching practice make such BS claims" )
Oliver.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://richmondmom.com/wp-content/uploads/2015/12/midwife.jpg')
Midwife = Service.new(title: 'Experimented Midwife', description: 'As a practicing midwife and technical
  advisor on global health programs, I have met midwives throughout Africa, Southeast Asia, and beyond in very
  low-resource settings and challenging circumstances, working hard every day to ensure women and newborns receive
  the high-quality care they deserve.', rate: 100, years_experience: 20, address: "5282 Boul St-Laurent" )
Midwife.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://wheelandphotography.com/wp-content/uploads/2016/04/travis_barton_life_coach_0002.jpg')
Lifecoach = Service.new(title: 'Life Coach 4 you', description: 'I AM Life Coaching
Corporate and Personal Life Coaching
Empowering holistic healing and corporate wellness.
They say that Leaders are born, not made. But with the right Life Coach true leaders are awakened to walk their journey!',
rate: 150, years_experience: 5, address: "5583 Av du Parc" )
Lifecoach.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://blog.logoscdn.com/wp-content/uploads/2017/04/bible-life-coach-620x340.jpg')
Lifecoach2 = Service.new(title: 'Life Coach expert', description: 'I AM Life Coaching
Corporate and Personal Life Coaching
Empowering holistic healing and corporate wellness.
They say that Leaders are born, not made. But with the right Life Coach true leaders are awakened to walk their journey!',
rate: 90, years_experience: 2, address: "88 Rue Bernard O" )
Lifecoach2.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://image.shutterstock.com/image-photo/life-coach-260nw-622780112.jpg')
Lifecoach3 = Service.new(title: 'Life Coach love', description: 'I AM Life Coaching
Corporate and Personal Life Coaching
Empowering holistic healing and corporate wellness.
They say that Leaders are born, not made. But with the right Life Coach true leaders are awakened to walk their journey!',
rate: 90, years_experience: 2, address: "16 Rue Maguire" )
Lifecoach3.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F38%2F2019%2F06%2F12221800%2Fmidwife-with-pregnant-woman.jpg&q=85')
Midwife2 = Service.new(title: 'Dreamy Midwife', description: 'As a practicing midwife and technical
  advisor on global health programs, I have met midwives throughout Africa, Southeast Asia, and beyond in very
  low-resource settings and challenging circumstances, working hard every day to ensure women and newborns receive
  the high-quality care they deserve.', rate: 200, years_experience: 20, address: "176 Saint Viateur West Street")
Midwife2.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://image.shutterstock.com/image-photo/blond-young-midwife-examination-belly-260nw-1157403862.jpg')
Midwife3 = Service.new(title: 'Best Midwife', description: 'As a practicing midwife and technical
  advisor on global health programs, I have met midwives throughout Africa, Southeast Asia, and beyond in very
  low-resource settings and challenging circumstances, working hard every day to ensure women and newborns receive
  the high-quality care they deserve.', rate: 140, years_experience: 20, address: "9 Fairmount Ave E")
Midwife3.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

Lifecoach3.user = Oliver
Lifecoach3.save

Lifecoach2.user = Jamie
Lifecoach2.save

Midwife3.user = Penelope
Midwife3.save

Midwife2.user = Joanna
Midwife2.save

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
    file = URI.open('https://source.unsplash.com/featured/?people')
    user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

  rand(1..10).times do
    service = Service.new(title: Faker::Job.field ,description: Faker::Hacker.say_something_smart,
      rate: rand(10..300), years_experience: rand(1..7))
    file = URI.open('https://source.unsplash.com/featured/?health')
    service.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    service.user = user
    service.save
  end
end


puts "Seeding done!"

