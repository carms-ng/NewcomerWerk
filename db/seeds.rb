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
  the high-quality care they deserve.', rate: 100, years_experience: 20, address: "5282 St-Laurent, Montreal" )
Midwife.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


file = URI.open('https://wheelandphotography.com/wp-content/uploads/2016/04/travis_barton_life_coach_0002.jpg')
Lifecoach = Service.new(title: 'Life Coach 4 you', description: 'I AM Life Coaching
Corporate and Personal Life Coaching
Empowering holistic healing and corporate wellness.
They say that Leaders are born, not made. But with the right Life Coach true leaders are awakened to walk their journey!',
rate: 150, years_experience: 5, address: "351 Rue de Bellechasse Montréal" )
Lifecoach.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://blog.logoscdn.com/wp-content/uploads/2017/04/bible-life-coach-620x340.jpg')
Lifecoach2 = Service.new(title: 'Life Coach expert', description: 'I AM Life Coaching
Corporate and Personal Life Coaching
Empowering holistic healing and corporate wellness.
They say that Leaders are born, not made. But with the right Life Coach true leaders are awakened to walk their journey!',
rate: 90, years_experience: 2, address: "88 Rue Bernard O, Montreal" )
Lifecoach2.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://www.rhodescollege.ca/wp-content/uploads/2017/02/Define-Your-Niche-After-Life-Coaching-School.jpg')
Lifecoach3 = Service.new(title: 'Life Coach', description: 'I AM Life Coaching
Corporate and Personal Life Coaching
Empowering holistic healing and corporate wellness.
They say that Leaders are born, not made. But with the right Life Coach true leaders are awakened to walk their journey!',
rate: 90, years_experience: 2, address: "16 Rue Maguire Montreal" )
Lifecoach3.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F38%2F2019%2F06%2F12221800%2Fmidwife-with-pregnant-woman.jpg&q=85')
Midwife2 = Service.new(title: 'Dreamy Midwife', description: 'As a practicing midwife and technical
  advisor on global health programs, I have met midwives throughout Africa, Southeast Asia, and beyond in very
  low-resource settings and challenging circumstances, working hard every day to ensure women and newborns receive
  the high-quality care they deserve.', rate: 200, years_experience: 20, address: "5333 Ave Casgrain, Montreal")
Midwife2.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://asiapacific.unfpa.org/sites/default/files/styles/news_detail_style/public/news/IMG_3511.jpg?itok=pshcgHXC')
Midwife3 = Service.new(title: 'Best Midwife', description: 'As a practicing midwife and technical
  advisor on global health programs, I have met midwives throughout Africa, Southeast Asia, and beyond in very
  low-resource settings and challenging circumstances, working hard every day to ensure women and newborns receive
  the high-quality care they deserve.', rate: 140, years_experience: 20, address: "9 Fairmount Ave E")
Midwife3.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://cliniqueremixsante.com/wp-content/uploads/2015/03/massotherapie.jpg')
MassageTherapist = Service.create!(user: Oliver, title: 'Best Massage Therapist',rate: 100, years_experience: 20, address: "9 Fairmount Ave E",description: 'In traditional therapeutic massage the muscles or muscle groups when too tight are stimulated in conjunction with acupressure points using directional movements; either trenching , cross hatching or pressing and running motions.', rate: 100)
MassageTherapist.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

file = URI.open('https://cliniqueremixsante.com/wp-content/uploads/2015/03/massotherapie.jpg')
MassageTherapist2 = Service.create!(user: Jamie, title: 'Experienced Massage Therapist',rate: 100, years_experience: 20, address: "50 Fairmount Ave E",description: 'In traditional therapeutic massage the muscles or muscle groups when too tight are stimulated in conjunction with acupressure points using directional movements; either trenching , cross hatching or pressing and running motions.', rate: 100)
MassageTherapist2.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

booking1 = Booking.create!(service: MassageTherapist, user: Marion, start: Time.now, end: Time.now, message: "In traditional therapeutic massage the muscles or muscle groups when too tight are stimulated in conjunction with acupressure points using directional movements; either trenching , cross hatching or pressing and running motions.")
booking2 = Booking.create!(service: MassageTherapist2, user: Priyanka, start: Time.now, end: Time.now, message: "In traditional therapeutic massage the muscles or muscle groups when too tight are stimulated in conjunction with acupressure points using directional movements; either trenching , cross hatching or pressing and running motions.")

review2 = Review.create!(rating: 4, booking_id: booking2.id, content:"Jamie was really amazing, she helped me relax, I appreciated so much her calming hands")
review1 = Review.create!(rating: 1, booking_id: booking1.id, content:"I went to Oliver's place to get a massage because I was feeling stressed and had some tension in my back... I specificaly asked him to massage only my back, but he spent the entire hour massaging my feet. I felt very embarassed! Plus, his cat
  jumped on me a couple of time, so it wasnt relaxing, and I came out more stressed then before I came in.... Not a good experience at all !" )

Lifecoach2.user = Jamie
Lifecoach2.save!

Midwife3.user = Penelope
Midwife3.save!

Midwife2.user = Joanna
Midwife2.save!

Midwife.user = Priyanka
Midwife.save!

Lifecoach.user = Morgan
Lifecoach.save!

puts "Seeding done!"

