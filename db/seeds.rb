require 'faker'
require "open-uri"

p "destroying: User | Service | Booking | Review"
User.destroy_all
Service.destroy_all
Booking.destroy_all
Review.destroy_all

p "seeding"

address = [
  '5333 Casgrain Ave #102, Montreal, Quebec H2T 1X3',
  '845 Sherbrooke St W, Montreal, Quebec H3A 0G4',
  '1455 Boulevard de Maisonneuve O, Montréal, QC H3G 1M8',
  '5505 Boul St-Laurent #2000, Montréal, QC H2T 1S6',
  '3575 Park Ave, Montreal, Quebec H2X 3P9',
  '977 Saint-Catherine St W, Montreal, Quebec H3B 4W3',
  '351 Laurier Ave E, Montreal, Quebec H2T 1G7',
  '5000 Casgrain Ave #102, Montreal, Quebec ',
  '825 Sherbrooke St W, Montreal, Quebec ',
  '1400 Boulevard de Maisonneuve O, Montréal, QC',
  '5205 Boul St-Laurent #2000, Montréal, QC',
  '3275 Park Ave, Montreal, Quebec',
  '777 Saint-Catherine St W, Montreal, Quebec',
  '451 Laurier Ave E, Montreal, Quebec',
  '5800 Esplanade Ave, Montreal, Quebec',
  '4244 Waverly Ave, Montreal, Quebec',
  '4222 Jeanne Mance St, Montreal, Quebec',
  '4600 Parc Ave, Montreal, Quebec',
  '551 Mont-Royal Ave E, Montreal, Quebec H2J 1W4',
  '3500 Casgrain Ave #102, Montreal, Quebec ',
  '425 Sherbrooke St W, Montreal, Quebec ',
  '549 Mont-Royal Ave E, Montreal, Quebec H2J 1W4',
  '2400 Boulevard de Maisonneuve O, Montréal, QC',
  '6205 Boul St-Laurent #2000, Montréal, QC',
  '3285 Park Ave, Montreal, Quebec',
  '777 Saint-Catherine St W, Montreal, Quebec',
  '558 Laurier Ave E, Montreal, Quebec',
  '5300 Esplanade Ave, Montreal, Quebec',
  '4220 Waverly Ave, Montreal, Quebec',
  '4890 Jeanne Mance St, Montreal, Quebec',
  '4400 Parc Ave, Montreal, Quebec',
  '4290 Saint-Laurant Boulevard, Montreal, Quebec',
  '5500 Casgrain Ave #102, Montreal, Quebec ',
  '9 Sherbrooke St W, Montreal, Quebec ',
  '1900 Boulevard de Maisonneuve O, Montréal, QC',
  '5905 Boul St-Laurent #2000, Montréal, QC',
  '3285 Park Ave, Montreal, Quebec',
  '999 Saint-Catherine St W, Montreal, Quebec',
]

city_origin = [
  'Paris, France',
  'Hong Kong',
  'Tunis, Tunisia',
  'New York City, United States',
  'Moscow, Russia',
  'Bangkok, Thailand',
  'Tokyo, Japan',
  'Dubai, United Arab Emirates',
  'Singapore',
  'Barcelona, Spain',
  'Los Angeles, United States',
  'Rome, Italy',
  'San Francisco, United States',
  'Madrid, Spain',
  'Chicago, United States',
  'Amsterdam, Netherlands',
  'Doha, Qatar',
  'Sydney, Australia'
]

profile_images = [
  'https://images.unsplash.com/photo-1477118476589-bff2c5c4cfbb?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1506919258185-6078bba55d2a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1505503693641-1926193e8d57?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1488161628813-04466f872be2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1484863137850-59afcfe05386?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1464746133101-a2c3f88e0dd9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1520813792240-56fc4a3765a7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1457131760772-7017c6180f05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1530268729831-4b0b9e170218?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1496840220025-4cbde0b9df65?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1492446845049-9c50cc313f00?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1527631746610-bca00a040d60?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1506277886164-e25aa3f4ef7f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1489980557514-251d61e3eeb6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1500917293891-ef795e70e1f6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1484688493527-670f98f9b195?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1509955252650-8f558c2b8735?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1450297350677-623de575f31c?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1479936343636-73cdc5aae0c3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1492633423870-43d1cd2775eb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1484588168347-9d835bb09939?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1498387727476-b30055b2ef21?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1489779162738-f81aed9b0a25?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1515486191131-efd6be9f711f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1492447166138-50c3889fccb1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1485178575877-1a13bf489dfe?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1484972759836-b93f9ef2b293?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1500336624523-d727130c3328?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  'https://images.unsplash.com/photo-1441716844725-09cedc13a4e7?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80',
]

COMMENTS = [
  "Amazing, love the services provided.  Can't be more pleased.",
  'Awesome! Going back anytime! super nice, super helpful',
  'To be honest, they were just too disorganized',
  'Best thing ever! It was so much  more than i expected',
  'They have so much tricks up their sleeves. Bravo!',
  'Great service!  Though availabilities are quite limited.',
  'Keep up with the good work!',
  'Easy to work with. Good organization, even though they have so much to juggle',
  'Wonderful human!  Kind and gentle! A++'
]

profession = {
  'Photographer' => [
    'https://images.unsplash.com/photo-1452587925148-ce544e77e70d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1520390138845-fd2d229dd553?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1471341971476-ae15ff5dd4ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1554048612-b6a482bc67e5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1462926795244-b273f8a5454f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1488926756850-a13b25e2f415?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1554646375-7bd5eedf4dae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1522204538344-922f76ecc041?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1464855499786-2839659d9e5d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1488684430052-f2d92fb178c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1486597622250-f997d79907f8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1495558761807-e324eceafffa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
  ],
  'Dog Walker' => [
    'https://images.unsplash.com/photo-1534361960057-19889db9621e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1560743641-3914f2c45636?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1521673461164-de300ebcfb17?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1520638889638-ef2b9ad8c393?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1580658358368-d8bea1207f70?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1584624203967-133c3d42c71d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1586833150629-ed0afeb3fb8a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1579579456588-26a0e3e14f36?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1556959080-c7727bfbebab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1577480656960-56660d47314f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1537175823749-a461e8e1515e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1578091282198-66d24101a889?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1440484213749-75455820d2d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
  ],
  'Private Chef' => [
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1543362906-acfc16c67564?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1494859802809-d069c3b71a8a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1521305916504-4a1121188589?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1504113888839-1c8eb50233d3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1504712598893-24159a89200e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1540648639573-8c848de23f0a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1488992783499-418eb1f62d08?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1564675533183-b1a836ec6537?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1577106263724-2c8e03bfe9cf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
  ],
  'Personal Trainer' => [
    'https://images.unsplash.com/photo-1526506118085-60ce8714f8c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1549060279-7e168fcee0c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1535743686920-55e4145369b9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1534367507873-d2d7e24c797f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1574680178050-55c6a6a96e0a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1583454156935-ba06aef90b3f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1434682772747-f16d3ea162c3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1571019613914-85f342c6a11e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1541757088-1c919081357f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
  ],
  'Math Tutor' => [
    'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1509869175650-a1d97972541a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1560785496-3c9d27877182?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1509228627152-72ae9ae6848d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1509228627152-72ae9ae6848d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1560785477-d43d2b34e0df?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1511377107391-116a9d5d20b5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1578194475681-ba5fc5dd17e8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1511376868136-742c0de8c9a8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1570618210461-fd5f194f9b59?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1514772814198-d0eda813d1c3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1497633762265-9d179a990aa6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1526253038957-bce54e05968e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
  ],
}

# 'Herbalist',
# 'Personal Shopper',
# 'Graphic Designer',
# 'Math Tutor',
# 'Translator'

adjectives = [
  'Amazing',
  'Wonderful',
  'Magical',
  'Fantastic',
  'The best',
  'Affortable',
  'Exciting',
  'Enthusiastic',
  'Experienced',
  'Expert'
]

profile_images.each_with_index do |url, i|
  user = User.new(
    first_name: Faker::Name.unique.first_name, 
    last_name: Faker::Name.last_name,
    password: 123456,
    origin: city_origin.sample,
    location: 'Montreal, Quebec',
    description: Faker::Quote.famous_last_words
  )
  file = URI.open(url)
  user.email = user.first_name + '@gmail.com'
  user.photo.attach(io: file, filename: 'unsplash_profile_pic.png', content_type: 'image/png')
  user.save
end

# create Services
profession.each do |k, v|
  10.times do
    service = Service.new(
      user: User.all.sample,
      rate: rand(50..150),
      title: "#{adjectives.sample} #{k}",
      description: Faker::Hipster.paragraph,
      years_experience: rand(1..30),
      address: address.sample
    )
    rand(1..3).times do
      file = URI.open(v.sample)
      service.photos.attach(io: file, filename: 'unsplash_profession.png', content_type: 'image/png')
    end
    service.save
  end
end

# Create Bookings & Reviews
def create_review(booking)
  return unless booking.status == 'completed'

  review = Review.create(
    booking: booking,
    rating: rand(2..5),
    content: COMMENTS.sample
  )
  review.update!(created_at: booking.start + rand(1..7).days)
  
  p review
end

User.all.each do |user|
  rand(1..20).times do
    service = Service.all.sample
    
    unless service.user == user
      booking = Booking.new(
        service: service,
        user: user,
        start: rand(1..365).days.ago
      )
      booking.end = booking.start + rand(1..4).hours
      booking.status = ['completed', 'declined', 'canceled'].sample
      booking.save

      p booking
      create_review(booking)
    end
    
  end
end

# old

# file = URI.open('https://fr.web.img6.acsta.net/pictures/16/05/17/11/00/419951.jpg')
# Marion = User.create(first_name: 'Marion', last_name: 'Cotillard',
#   email: 'marion.cotillard@gmail.com', password:'123456', location: 'Paris', description:"If you're looking to be told I can 10x your business or help you bring in a stream of 'high ticket' clients who are begging to work with you, then you're in the wrong place.I let the people who have never built a coaching practice make such BS claims")
# Marion.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')


# file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Morgan_Freeman_Deauville_2018.jpg/260px-Morgan_Freeman_Deauville_2018.jpg')
# Morgan = User.create(first_name: 'Morgan', last_name: 'Freeman',
#   email: 'morgan.freeman@hotmail.com', password: '123456', location: 'Memphis', description: "If you're looking to be told I can 10x your business or help you bring in a stream of 'high ticket' clients who are begging to work with you, then you're in the wrong place.
#   I let the people who have never built a coaching practice make such BS claims")
# Morgan.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# file = URI.open('https://media1.popsugar-assets.com/files/thumbor/1LFgBBorpx7-MhR0Rpg60ija2jM/fit-in/500x500/filters:format_auto-!!-:strip_icc-!!-/2015/08/03/765/n/1922398/e3d0edd9_edit_img_image_88_1416727419/i/Jamie-Chung.png')
# Jamie = User.create(first_name: 'Jamie', last_name: 'Chung',
#   email: 'jamie.chung@gmail.com', password:'123456', location: 'San Francisco', description: "If you're looking to be told I can 10x your business or help you bring in a stream of 'high ticket' clients who are begging to work with you, then you're in the wrong place.
#   I let the people who have never built a coaching practice make such BS claims")
# Jamie.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# file = URI.open('https://d3d127vhjgkwcw.cloudfront.net/images/articles/2020_02/katie-holmes-6001.jpg')
# Joanna = User.create(first_name: 'Joanna', last_name: 'Moubta',
#   email: 'joanna.moubta@gmail.com', password:'123456', location: 'Toronto', description: "Experienced Midwife with a demonstrated history of working in the medical practice industry, looking to transition into a new career. Skilled in Midwifery,
#   Medical office administration including planning and managing budgets, data entry. Strong healthcare services professional with a PCE focused in Adult and Continuing Education and Teaching from Anglia Ruskin University.")
# Joanna.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Penelope_Cruz_Cannes_2018.jpg/260px-Penelope_Cruz_Cannes_2018.jpg')
# Penelope = User.create(first_name: 'Penelope', last_name: 'Cruz',
#   email: 'penelope.cruz@gmail.com', password:'123456', location: 'Madrid', description: "Experienced Midwife with a demonstrated history of working in the medical practice industry, looking to transition into a new career. Skilled in Midwifery, Medical office administration including planning and managing budgets, data entry.
#   Strong healthcare services professional with a PCE focused in Adult and Continuing Education and Teaching from Anglia Ruskin University.")
# Penelope.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# file = URI.open('https://www.biography.com/.image/t_share/MTMyNzczNjA0ODM5NDUyNjQy/priyanka-chopra-shutterstock_303288878_1290jpg.jpg')
# Priyanka = User.create(first_name: 'Priyanka', last_name: 'Chopra',
#   email: 'priyanka.chopra@gmail.com', password: '123456', location: 'Jamshedpur', description: "Experienced Midwife with a demonstrated history of working in the medical practice industry,
#   looking to transition into a new career. Skilled in Midwifery, Medical office administration including planning and managing budgets, data entry. Strong healthcare services professional with a PCE focused in Adult and Continuing Education and Teaching from Anglia Ruskin University.")
# Priyanka.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# file = URI.open('https://images.thestar.com/F0VhDpMu7NB9Waf6wxVcgPEfbL0=/650x650/smart/filters:cb(1548689313694)/https://www.thestar.com/content/dam/thestar/entertainment/television/analysis/2019/01/25/is-this-the-breakout-year-for-asian-men-in-leading-roles/simu_liu.jpg')
# Oliver = User.create(first_name: 'Oliver', last_name: 'Nguyen',
#   email: 'oliver.nguyen@gmail.com', password: '123456', location: 'Montreal', description: "If you're looking to be told I can 10x your business or help you bring in a stream of 'high ticket' clients who are begging to work with you, then you're in the wrong place.
#   I let the people who have never built a coaching practice make such BS claims" )
# Oliver.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')


# file = URI.open('https://richmondmom.com/wp-content/uploads/2015/12/midwife.jpg')
# Midwife = Service.new(title: 'Experimented Midwife', description: 'As a practicing midwife and technical
#   advisor on global health programs, I have met midwives throughout Africa, Southeast Asia, and beyond in very
#   low-resource settings and challenging circumstances, working hard every day to ensure women and newborns receive
#   the high-quality care they deserve.', rate: 100, years_experience: 20, address: "5282 St-Laurent, Montreal" )
# Midwife.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


# file = URI.open('https://wheelandphotography.com/wp-content/uploads/2016/04/travis_barton_life_coach_0002.jpg')
# Lifecoach = Service.new(title: 'Life Coach 4 you', description: 'I AM Life Coaching
# Corporate and Personal Life Coaching
# Empowering holistic healing and corporate wellness.
# They say that Leaders are born, not made. But with the right Life Coach true leaders are awakened to walk their journey!',
# rate: 150, years_experience: 5, address: "351 Rue de Bellechasse Montréal" )
# Lifecoach.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# file = URI.open('https://blog.logoscdn.com/wp-content/uploads/2017/04/bible-life-coach-620x340.jpg')
# Lifecoach2 = Service.new(title: 'Life Coach expert', description: 'I AM Life Coaching
# Corporate and Personal Life Coaching
# Empowering holistic healing and corporate wellness.
# They say that Leaders are born, not made. But with the right Life Coach true leaders are awakened to walk their journey!',
# rate: 90, years_experience: 2, address: "88 Rue Bernard O, Montreal" )
# Lifecoach2.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# file = URI.open('https://www.rhodescollege.ca/wp-content/uploads/2017/02/Define-Your-Niche-After-Life-Coaching-School.jpg')
# Lifecoach3 = Service.new(title: 'Life Coach', description: 'I AM Life Coaching
# Corporate and Personal Life Coaching
# Empowering holistic healing and corporate wellness.
# They say that Leaders are born, not made. But with the right Life Coach true leaders are awakened to walk their journey!',
# rate: 90, years_experience: 2, address: "16 Rue Maguire Montreal" )
# Lifecoach3.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# file = URI.open('https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F38%2F2019%2F06%2F12221800%2Fmidwife-with-pregnant-woman.jpg&q=85')
# Midwife2 = Service.new(title: 'Dreamy Midwife', description: 'As a practicing midwife and technical
#   advisor on global health programs, I have met midwives throughout Africa, Southeast Asia, and beyond in very
#   low-resource settings and challenging circumstances, working hard every day to ensure women and newborns receive
#   the high-quality care they deserve.', rate: 200, years_experience: 20, address: "5333 Ave Casgrain, Montreal")
# Midwife2.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# file = URI.open('https://asiapacific.unfpa.org/sites/default/files/styles/news_detail_style/public/news/IMG_3511.jpg?itok=pshcgHXC')
# Midwife3 = Service.new(title: 'Best Midwife', description: 'As a practicing midwife and technical
#   advisor on global health programs, I have met midwives throughout Africa, Southeast Asia, and beyond in very
#   low-resource settings and challenging circumstances, working hard every day to ensure women and newborns receive
#   the high-quality care they deserve.', rate: 140, years_experience: 20, address: "9 Fairmount Ave E Montreal")
# Midwife3.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# file = URI.open('https://cliniqueremixsante.com/wp-content/uploads/2015/03/massotherapie.jpg')
# MassageTherapist = Service.create!(user: Oliver, title: 'Best Massage Therapist', rate: 100, years_experience: 20, address: "9 Fairmount Ave E, Montreal", description: 'In traditional therapeutic massage the muscles or muscle groups when too tight are stimulated in conjunction with acupressure points using directional movements; either trenching , cross hatching or pressing and running motions.' )
# MassageTherapist.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# file = URI.open('https://cliniqueremixsante.com/wp-content/uploads/2015/03/massotherapie.jpg')
# MassageTherapist2 = Service.create!(user: Jamie, title: 'Experienced Massage Therapist', rate: 100, years_experience: 20, address: "50 Fairmount Ave E, Montreal", description: 'In traditional therapeutic massage the muscles or muscle groups when too tight are stimulated in conjunction with acupressure points using directional movements; either trenching , cross hatching or pressing and running motions.' )
# MassageTherapist2.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# booking1 = Booking.create!(service: MassageTherapist, user: Marion, start: Time.now, end: Time.now, message: "In traditional therapeutic massage the muscles or muscle groups when too tight are stimulated in conjunction with acupressure points using directional movements; either trenching , cross hatching or pressing and running motions.")
# booking2 = Booking.create!(service: MassageTherapist2, user: Priyanka, start: Time.now, end: Time.now, message: "In traditional therapeutic massage the muscles or muscle groups when too tight are stimulated in conjunction with acupressure points using directional movements; either trenching , cross hatching or pressing and running motions.")
# booking3 = Booking.create!(service: MassageTherapist2, user: Priyanka, start: Time.now, end: Time.now, message: "In traditional therapeutic massage the muscles or muscle groups when too tight are stimulated in conjunction with acupressure points using directional movements; either trenching , cross hatching or pressing and running motions.")
# booking4 = Booking.create!(service: MassageTherapist2, user: Priyanka, start: Time.now, end: Time.now, message: "In traditional therapeutic massage the muscles or muscle groups when too tight are stimulated in conjunction with acupressure points using directional movements; either trenching , cross hatching or pressing and running motions.")
# booking5 = Booking.create!(service: MassageTherapist2, user: Priyanka, start: Time.now, end: Time.now, message: "In traditional therapeutic massage the muscles or muscle groups when too tight are stimulated in conjunction with acupressure points using directional movements; either trenching , cross hatching or pressing and running motions.")
# booking6 = Booking.create!(service: MassageTherapist, user: Jamie, start: Time.now, end: Time.now, message: "In traditional therapeutic massage the muscles or muscle groups when too tight are stimulated in conjunction with acupressure points using directional movements; either trenching , cross hatching or pressing and running motions.")

# review6 = Review.create!(rating: 5, booking_id: booking6.id, content:"Oliver is great!")
# review5 = Review.create!(rating: 3, booking_id: booking5.id, content:"Jamie was really amazing, she helped me relax, I appreciated so much her calming hands")
# review4 = Review.create!(rating: 2, booking_id: booking4.id, content:"Jamie was really amazing, she helped me relax, I appreciated so much her calming hands")
# review3 = Review.create!(rating: 5, booking_id: booking3.id, content:"Jamie was really amazing, she helped me relax, I appreciated so much her calming hands")
# review2 = Review.create!(rating: 4, booking_id: booking2.id, content:"Jamie was really amazing, she helped me relax, I appreciated so much her calming hands")
# review1 = Review.create!(rating: 1, booking_id: booking1.id, content:"late cancelation" )

# Lifecoach2.user = Jamie
# Lifecoach2.save!

# Midwife3.user = Penelope
# Midwife3.save!

# Midwife2.user = Joanna
# Midwife2.save!

# Midwife.user = Priyanka
# Midwife.save!

# Lifecoach.user = Morgan
# Lifecoach.save!

# puts "Seeding done!"

