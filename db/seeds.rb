# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


site_admin = User.create(name: "site_admin", email: "admin@admin.admin", password: "password", role: 'admin', last_name: Faker::Name.last_name, address1: Faker::Address.building_number, address2: Faker::Address.street_name, city: Faker::Address.city, postcode: Faker::Address.postcode, username: Faker::Internet.user_name)
ada = User.create(name: "Ada", email: "ada@email.example", password: 'password', role: 'user', last_name: "Jones", address1: Faker::Address.building_number, address2: Faker::Address.street_name, city: Faker::Address.city, postcode: Faker::Address.postcode, username: Faker::Internet.user_name)
obedia = User.create(name: "Obedia", email: "obedia@email.example", password: 'password', role: 'user', last_name: "Smith", address1: Faker::Address.building_number, address2: Faker::Address.street_name, city: Faker::Address.city, postcode: Faker::Address.postcode, username: Faker::Internet.user_name)
tristan = User.create(name: "Tristan", email: "tristan@email.example", password: 'password', role: 'user', last_name: "Johnson", address1: Faker::Address.building_number, address2: Faker::Address.street_name, city: Faker::Address.city, postcode: Faker::Address.postcode, username: Faker::Internet.user_name)
isolde = User.create(name: "Isolde", email: "isolde@email.example", password: 'password', role: 'user', last_name: "Martin", address1: Faker::Address.building_number, address2: Faker::Address.street_name, city: Faker::Address.city, postcode: Faker::Address.postcode, username: Faker::Internet.user_name)

Category.create(name: 'Arts')
Category.create(name: 'Business')
Category.create(name: 'Charities')
Category.create(name: 'Civic Space')
Category.create(name: 'Community')
Category.create(name: 'Environment')
Category.create(name: 'Film')
Category.create(name: 'Food & Drink')
Category.create(name: 'Music')
Category.create(name: 'Publishing')
Category.create(name: 'Schools')
Category.create(name: 'Social Enterprise')
Category.create(name: 'Sports')
Category.create(name: 'Technology')
Category.create(name: 'Theatre & Dance')
Category.create(name: 'University & College')

cities =[
  'Aberdeen',
  'Airdrie',
  'Alloa',
  'Arbroath',
  'Ayr',
  'Barrhead',
  'Bathgate',
  'Bearsden',
  'Bellshill',
  'Bishopbriggs',
  'Blantyre',
  'Bonnyrigg',
  'Broxburn',
  'Cambuslang',
  'Clydebank',
  'Coatbridge',
  'Cumbernauld',
  'Dumbarton',
  'Dumfries',
  'Dundee',
  'Dunfermline',
  'East Kilbride',
  'Edinburgh',
  'Elgin',
  'Erskine',
  'Falkirk',
  'Glasgow',
  'Glenrothes',
  'Grangemouth',
  'Greenock',
  'Hamilton',
  'Inverness',
  'Irvine',
  'Johnstone',
  'Kilmarnock',
  'Kilwinning',
  'Kirkcaldy and Dysart',
  'Kirkintilloch',
  'Larkhall',
  'Livingston',
  'Motherwell',
  'Musselburgh',
  'Newton Mearns',
  'Paisley',
  'Penicuik',
  'Perth',
  'Peterhead',
  'Port Glasgow',
  'Renfrew',
  'Rutherglen',
  'St Andrews',
  'Stirling',
  'Viewpark',
  'Wishaw'
  ]

cities.each do |city|
  Location.create(name: city)
end

p1 = Project.create(name: "Restore the church clock.", summary: "The New Kilpatrick parish church clock was donated by Lord Buckingham in 1872. The dial, face and  mechanism is now in need of restoration in order to save this historic piece of Scottish history.", target: 10000, start_date: "2015-11-11", end_date: "2016-02-25", user_id: 2, location: Location.where(name: "Bearsden").first, description: "The clock dial and mechanism have been a part of the history of the church for 139 years. However, following a period of neglect, they are now in desperate need of some restoration. We have consulted a specialist engineer and they believe the clock is repairable. As such, we would like to raise the money necessary to save the clock. We'll restore the clock back to what it originally looked like in 1876.", category_id: 4, project_image: "", days: 106)
p2 = Project.create(name: "Drumry Orchard Project", summary: "The aim of this project is to make our parks greener by planting orchards for local people.", target: 5200, start_date: "2015-11-11", end_date: "2016-02-25", user_id: 5, location: Location.where(name: "Clydebank").first, description: "We will be hoping to launch The 'Drumry Orchard Project' on 5th December 2015. We want our parks to be filled with a variety of fruit & nut trees which will provide free food for local people to eat, cook with and enjoy. Although we hope to complete the project within 3 years, we also want to go on taking care of the trees as a community long after. We intend to this by: utilising the expertise of local garden centres, recruit local volunteer ‘Wardens’, provide ongoing training and support for the volunteers, organise fruit harvesting and litter picking events, engage with local schools and hold promotional events to publicise the project. If this sounds like a good idea to you then, please, pledge a small donation to our local cause and help us realise our dream. Thank you.", category_id: 6, project_image: "", days: 106)
p3 = Project.create(name: "Help set up the Erskine Playbus", summary: "Playbuses have been visiting local communities across the country for years. We would like to bring one to Erskine. In the summer, a playbus in central Edinburgh welcomed over 70 children per session.  Please help us so we can set up a local playbus for Erskine in Spring 2016!", target: 3000, start_date: "2015-11-11", end_date: "2016-02-25", user_id: 4, location: Location.where(name: "Erskine").first, description: "The Bargarran Community Education Centre has a well loved green space surrounded by dense housing. There are several housing estates where families live, often without outside space. Our aim is to make sure that all families know what local support and facilities are available. Playbus sessions are a fantastic place for families to meet and share experiences and advice. Please help us make these sessions a reality. With your help to we will have more time to secure funding from official chairities and sources so we can get more families out in the park, prevent isolation and have fun long into the future!", category_id: 11, project_image: "", days: 106)
p4 = Project.create(name: "Converting the old firestation into a Community Space", summary: "Help us convert a disused firestation into a multi-use space and café! Our goal is to develop this into a communal space in the city's heart.", target: 28789, start_date: "2015-11-11", end_date: "2016-02-25", user_id: 4, location: Location.where(name: "Edinburgh").first, description: "We want to transform an abandoned fire station, into a cultural space for the whole local community. We have been offered a partnership with the current owners, SomGuys Business Ltd, to make use of this space and we see this as an opportunity to bring together the inhabitants of this part of the city of Edinburgh and beyond. We will create a meeting point through organising and programming a series of events, performances and activities within the fire station, and turn the adjacent machine room into a small café. This non-profit events space, social hub and café will be utilised by all. To achieve our goal we are going to first clean, paint (both interior and exterior) and soundproof the fire station.Then we will strip the machine room, replace the doors and install sound proof window(s). We will also update the electricity, water supply, toilets, lights and add a speaker system (PA) with further audio visual equipment. Finally, we will build and maintain a small café/bar area to make the space self-supporting and organise fundraising in and around Edinburgh to raise further money for the project where needed.", category_id: 1, project_image: "", days: 106)
p5 = Project.create(name: "Gig in the Pub", summary: "Gig in the Pub: an annual event showcasing local, young, musical talent from across Grangemouth. We would like to set up and hold this event at the Kersiebank Community Centre.", target: 5430, start_date: "2015-11-11", end_date: "2016-02-25", user_id: 3, location: Location.where(name: "Grangemouth").first, description: "We would like to establish a yearly event for young musicians, across Grangemouth, to come along and showcase their talent. The event will be held in Kersiebank's community hub and the event is estimated to attract between 6-10 different bands and around 20 young performers. We want it to be free of charge both to attend and to perform, making it accessible for all. The music genres would be diverse and dependent on the interests and talents of the young performers. This may include folk, rock, rap and pop. Grangemouth has a track record of producing talent and the 'Gig in the Pub' may play a key part in nurturing and showcasing this talent. This is where you come in. The hub's equipment is old & outdated, it now needs new lighting, amp & speakers. For the gig to be established, we want to raise the money to do the following things: purchase new speakers, purchase an amplifier, purchase a lighting rig, install speakers, amplifier and lighting, promote the event to young musicians, develop the programme of acts and publicise the gig to the wider community. Last and not least, hold the event!", category_id: 9, project_image: "", days: 106)
p6 = Project.create(name: "Play on the Green", summary: "Following years of neglect and chronic under use, we want to help reclaim a precious piece of green in our busy urban landscape for local families to enjoy and play!", target: 3000, start_date: "2015-11-11", end_date: "2016-02-25", user_id: "3", location: Location.where(name: "Glasgow").first, description: "Magic Green sits almost exactly halfway along Glasgow High Road. In an area of high population and traffic congestion, Magic Green has great potential, but for many years it has suffered the of street drinking, neglect and pigeons. By introducing a play environment, we could reclaim the space and encourage families to spend time there -enjoying the play facilities and helping to reignite the space. In turn, this would see increased interest both in the market, and local shops and help promote the area. Not only improving the look and feel of Magic Green, it would also serve as a physical meeting place to engage with the community. We will work with local businesses and volunteers to ensure the following: support for the project, the set up and pack away of the play equipment/seating and listen to feedback about how the project can be improved. If you'd love Play on the Green to start, please show your support by making a pledge!", category_id: "5", project_image: "", days: 106)
p7 = Project.create(name: "Social room for the hospice", summary: "Our local hospice, on Dundee's Road, is currently in desperate need to funds for a new social area where family and friends can enjoy each other's company.", target: 1679, start_date: "2015-11-11", end_date: "2016-02-25", user_id: 2, location: Location.where(name: "Dundee").first, description: "Our local hospice provides important end of life care for those facing a terminal illness, their families and friends. The current social room is inadequate, leading to many people having to spend time alone in their rooms. We want to change this by raising money to help do the following: build an extension on the current social room, refurbish and provide new furniture once the extension is built, provide some form of entertainment (new t.v., board games, etc) and give those who need it the chance to experience a dignified life of love and care. To do this we want to organise a number of events to help raise money for the room. You can either help us by donating on this site or volunteering and help us set up events to raise money from the local community. Thank you.", category_id: 8, project_image: "", days: 106)
p8 = Project.create(name: "Helping the homeless at Christmas", summary: "We are sixth form students organising a Christmas music concert to help pay for winter care packages for the homeless in Glasgow.", target: 500, start_date: "2015-11-11", end_date: "2016-02-25", user_id: 4, location: Location.where(name: "Glasgow").first, description: "All Scots find the winter months long and cold, but for the homeless of Glasgow it is even harder. We want to put on a concert featuring acts from the local area, with stalls to raise the proceedings. With the money raised we will produce packages containing warm clothing, food, water etc. This will show that people in the local area do care about the problem of homelessness. Our group of 20 are passionate about what we are wanting to achieve and making a difference to people's lives. We have spoken with the local soup kitchen at Bethany Church and they will be helping make sure that everything is done to a good standard. How are we going to achieve this? We are going to plan our event and venue, coordinate our group of dedicated volunteers, work with Centrepoint to help plan and distribute the packages. We need £500 to get started, with the aim of tripling this through the event. Please give whatever you can. Thank you for the support and donations!", category_id: 3, project_image: "", days: 106)
p9 = Project.create(name: "The Linlithgow Light Box", summary: "Local phone box to be renovated and to become a light box to display local artwork and images.", target: 4356, start_date: "2015-11-11", end_date: "2016-02-25", user_id: 3, location: Location.where(name: "Edinburgh").first, description: "The “Linlithgow Light Box” is a decommissioned phonebox in Linlithgow, Edinburgh. An iconic example of British design, it has been adopted by the Linlithgow Community Council on behalf of the local community. It is currently being re-painted and re-glazed with a lock recently installed. We plan to fix three, full length, opaque white acrylic panels on the inside to act as a diffuser screen. Once extra fluorescent tubes are installed inside, we will have created a large light box from which to display images by local artists, schoolchildren or other groups. These images will change on a regular basis and we will also install low-energy LEDs to create a simple, colourful light display whilst other artwork is being prepared. Ultimately, we intend to raise funds to allow for a digital display system which has interactive participation with the local community. Other communities have adopted phoneboxes but we believe we are the first in an urban context to try this. ", category_id: 14, project_image: "", days: 106)
p10 = Project.create(name: "Shoe Boxes for Christmas from Edinburgh", summary: "Help us provide Christmas gifts for children who may otherwise go without at Christmas.", target: 1200, start_date: "2015-11-11", end_date: "2016-02-25", user_id: 5, location: Location.where(name: "Edinburgh").first, description: "A small shoebox can have a big impact. What goes into the box is fun, but what comes out of it is eternal. Be a part of changing children’s lives all over the world through the power of a simple gift. We are looking for donations to help us fill 1000 shoe boxes for orphanages all over the UK. We will fill your shoebox with a selection of fun toys, hygiene items and school supplies.Donations will also include transportation costs for each shoebox we pack. Please help us make a difference today.", category_id: 15, project_image: "", days: 106)
p11 = Project.create(name: "The Business Centre", summary: "Imagine a place where the young can create their business dreams, achieve their career aspirations and are celebrated not tolerated!", target: 21000, start_date: "2015-11-11", end_date: "2016-02-25", user_id: 5, location: Location.where(name: "Dunfermline").first, description: "The Business Centre will be for young people who want to create sustainable businesses that start up & stay up. The Business Centre is our vision for grassroots entrepreneurship. This is a big project that bring a huge social impact to the young people of the community, as it celebrates them for their skills they have, this is phase 1 where we will take over an old pub for our coworking training space. We hope to rent the pub we have in mind that we have identified will help build up the community, if by the time we raise the funds the pub is taken we will search for another one, there are plently of closed down pubs in the area. ", category_id: 12, project_image: "", days: 106)
p12 = Project.create(name: "East Kilbride Film Festival", summary: "An annual film festival to celebrate the extraordinary heritage of the early years of cinema.", target: 3450, start_date: "2015-11-11", end_date: "2016-02-25", user_id: 2, location: Location.where(name: "East Kilbride").first, description: "We want to host a festival of rare black and white films, give visitors a guided lecture about film locations used across Scotland as part of film heritage initiative, hold an exhibion of local film memorabilia and create a 1920s film location set for visitors to have an interactive experience of a film set filmed in black and white. We also want to offer talks and masterclasses by film historians who were actually involved in the making of films and showcase modern films also shot in Scotland.", category_id: 7, project_image: "", days: 106)
p13 = Project.create(name: "Pop Up Xmas Cinema", summary: "A Pop Up Cinema in Dumbarton Main St showing Christmas films so we can bring some fun and laughter to our community this Christmas.", target: 2560, start_date: "2015-11-11", end_date: "2016-02-25", user_id: 4, location: Location.where(name: "Dumbarton").first, description: "We would like to have a Cinema screen for one Saturday in December in the newly refurbished St Michael's car park showing three films. One for the little ones, one for families and one for grown families. We are aiming to bring some Christmas cheer in an open air cinema where we can all celebrate our town together. It will be free to watch the films and there will be numerous Christmas nibble stalls around to make it even more festive. We hope to demonstrate that this is something that can be run every year as part of Dumbarton's Christmas celebrations and will only need funding in year 1. How we'll get it done: pop up cinema from 1 of 3 suppliers (depending on dates), event managed by Dumbarton Town Chambers and voluntary groups, promotion through Facebook and local media. This will be a town project and I would encourage as many different community groups to get in touch and run their own Christmas Film day as part of a Christmas Film Festival. This could be the start of something special!", category_id: 7, project_image: "", days: 106)
p14 = Project.create(name: "Glasgow Breast Care Centre Appeal", summary: "Appeal for a brand new Breast Care Centre - helping to make a lasting difference to the lives of thousands of women living with, or at risk of, breast cancer across Glasgow and the surrounding area.", target: 256000, start_date: "2015-11-11", end_date: "2016-02-26", user_id: 5, location: Location.where(name: "Glasgow").first, description: "One in eight women will develop breast cancer during their lifetime. Our aim is to build a new care centre that will ensure that patients from across the Glasgow area continue to receive the highest levels of care with access to first-rate facilities. Challenges with current provision: Patients must visit a number of different sites in Glasgow in the different stages of their screening, diagnosis, treatment and after-care journey, causing a fragmented and distressing experience. Patients have identified the difficulties in receiving traumatic news, without having the appropriate spaces to think and take in their diagnosis and treatment options. Patients have spoken of the difficulty of sharing outpatient facilities with patients who were visiting for screening or routine appointments. We want to change this and you can help.", category_id: 3, project_image: "", days: 106)
p15 = Project.create(name: "Digital Noticeboard for Paisley", summary: "We want to install a digital noticeboard on Paisley High Road to showcase Paisley's unique offerings and vibrant community, connecting residents and visitors up with everything Paisley has to offer!", target: 32780, start_date: "2015-11-9", end_date: "2016-02-25", user_id: 3, location: Location.where(name: "Paisley").first, description: "Paisley High Road is diverse, lively, and full of surprises. But with heavy road traffic and a transient population, the unique character of the High Road can get lost. Local businesses have little support and there is no obvious network to connect them to residents or community groups. We would like to showcase Paisley's vibrant range of businesses as well as encouraging new independent traders, community groups and local charities. We propose installing a digital notice board located in a high footfall area opposite Paisley High Road to highlight local retailers, entertainment and community events and special offers, acting as a focal point for residents, and visitors alike! The board will show images and video, allowing independent retailers to advertise affordably as well as providing an exciting way of featuring Paisley information and talent. Ads will be made cheaper for those businesses and groups who support the community, in recognition of their support!", category_id: 5, project_image: "", days: 108)
p16 = Project.create(name: "A Case of History for Huntingtower Castle", summary: "We want to showcase your/our history.", target: 1250, start_date: "2015-11-10", end_date: "2016-02-25", user_id: 4, location: Location.where(name: "Perth").first, description: "We would like open a special new room. It would be full of fascinating objects that we can't show at the moment because we have no space. Imagine a room full of items from our past, Tudor times up to the present day, that have been donated - perhaps by you and your family. The Castle will reflect your history too. We'll show off some amazing things like swords, arrow tips and letters from St James' Palace. We already have a number of items from people who worked at the Castle and our collection is constantly expanding. The displays will change over time, reflect topical themes.So we need display cases too show them off. The cases themselves will be hand made by skilled, local craftsman. They will be regularly updated in line with various themes and also show projects that our local schools have completed on visits to the Hall.", category_id: 7, project_image: "", days: 107)
p17 = Project.create(name: "Cambridge Road lamp posts", summary: "Ensuring Cambridge Road has good street lighting that minimises the dazzle in people's homes and gardens - and is sympathetic to the architecture of the road.", target: 7343, start_date: "2015-11-11", end_date: "2015-12-01", user_id: 3, location: Location.where(name: "Paisley").first, description: "Cambridge Road residents have received a letter from the Council to say the only affordable street lighting are the ugly, tall thin columns that light the place up like a football stadium. There are other options available, some are on nearby roads, but the Council says it has no more money left. So if we do nothing, we get the ugly ones. This proposal is that residents of the road, who spend money on making their houses pleasant, could also contribute to making the street lamps more pleasant. Some households might contribute more, some less and some not at all. But between us we can make Cambridge Road a nicer road to live on and leave a better legacy for future residents. If we get enough funding to make it work, then we will. If we don't get enough, then you get your money back, and we get the standard lamp posts. If we get more than is needed, we'll agree with you what to spend the remainder on.", category_id: 4, project_image: "", days: -1)

p18 = Project.create(name: "Grow an Entrepreneur for Tomorrow", summary: "Help us turn an empty shop into a buzzing hub for young entrepreneurs! We'll create space where imaginations can be unleashed and bright business ideas brought to life.", target: 51079, start_date: "2015-11-11", end_date: "2016-02-25", user_id: 3, location: Location.where(name: "Wishaw").first, description: "With youth unemployment and shops vacancies both at record highs, we’ve developed a great idea that tackles both issues. Our new Ideas Hub, will allow budding entrepreneurs to share business ideas, get advice, and access support. Whether designing and selling clothes, creating new smartphone apps, setting up a radio station, or cooking culinary treats to service hungry traders, the bright ideas are out there. We just need to give them the right space to grow. The Hub will host five groups of young people, on three-month stints. Part of the money raised by our funding campaign will provide seed funding for the best business ideas, along with support from experienced businesses in the community. The aim is to nurture bright ideas into full-fledged enterprises in the real world. If you would like to see one of the town's empty spaces turned into a factory for young entrepreneurs, please click pledge to back this project!", category_id: 12, project_image: "", days: 106)

p1.project_image = File.open(File.join(Rails.root, "db/images/clock.jpg"))
p1.save!

p2.project_image = File.open(File.join(Rails.root, "db/images/orchardsmall.jpg"))
p2.save!

p3.project_image = File.open(File.join(Rails.root, "db/images/playbus.jpg"))
p3.save!

p4.project_image = File.open(File.join(Rails.root, "db/images/fire_house.jpg"))
p4.save!

p5.project_image = File.open(File.join(Rails.root, "db/images/edsheeran.jpg"))
p5.save!

p6.project_image = File.open(File.join(Rails.root, "db/images/Procession.jpg"))
p6.save!

p7.project_image = File.open(File.join(Rails.root, "db/images/hospice.jpg"))
p7.save!

p8.project_image = File.open(File.join(Rails.root, "db/images/homeless.jpg"))
p8.save!

p9.project_image = File.open(File.join(Rails.root, "db/images/lightbox.png"))
p9.save!

p10.project_image = File.open(File.join(Rails.root, "db/images/ShoeBoxAppeal.jpg"))
p10.save!

p11.project_image = File.open(File.join(Rails.root, "db/images/studying-students.jpg"))
p11.save!

p12.project_image = File.open(File.join(Rails.root, "db/images/filmf.jpg"))
p12.save!

p13.project_image = File.open(File.join(Rails.root, "db/images/wonderful.jpg"))
p13.save!

p14.project_image = File.open(File.join(Rails.root, "db/images/bc.jpg"))
p14.save!

p15.project_image = File.open(File.join(Rails.root, "db/images/image.jpg"))
p15.save!

p16.project_image = File.open(File.join(Rails.root, "db/images/castle.jpg"))
p16.save!

p17.project_image = File.open(File.join(Rails.root, "db/images/lamp.jpg"))
p17.save!

p18.project_image = File.open(File.join(Rails.root, "db/images/business.jpg"))
p18.save!

ada.user_image = File.open(File.join(Rails.root, "db/images/ada.jpg"))
ada.save!

obedia.user_image = File.open(File.join(Rails.root, "db/images/obedia.png"))
obedia.save!

tristan.user_image = File.open(File.join(Rails.root, "db/images/tristan.jpg"))
tristan.save!

isolde.user_image = File.open(File.join(Rails.root, "db/images/isolde.jpg"))
isolde.save!

site_admin.user_image = File.open(File.join(Rails.root, "db/images/admin.png"))
site_admin.save!

Reward.create(project_id: 17, description: "Thor's hammer", value: 50 , quantity: 1, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 17, description: "Your name engraved in a lamp post", value: 50 , quantity: 1, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 1, description: "One pencil", value: 10 , quantity: 1, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 18, description: "Golden mobility Scooter", value: 700 , quantity: 40, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 18, description: "A hat", value: 50 , quantity: 30, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 5, description: "Iron man costume", value: 100 , quantity: 40, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 5, description: "Teal shirt", value: 1 , quantity: 400, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 3, description: "Lollypop", value: 1 , quantity: 40, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 3, description: "Pants", value: 70 , quantity: 40, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 4, description: "Shiny boots", value: 60 , quantity: 90, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 4, description: "Pimp cane", value: 50 , quantity: 600, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 5, description: "Model cow", value: 5 , quantity: 4000, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 6, description: "Leopard print thong", value: 10 , quantity: 60, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 6, description: "Casio watch", value: 4 , quantity: 60, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 7, description: "Orchard", value: 7000 , quantity: 5, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 7, description: "Lots of booze!", value: 15 , quantity: 1000, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 8, description: "Paisley rug", value: 200 , quantity: 50, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 8, description: "Tartan slippers", value: 60 , quantity: 500, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 9, description: "Cuddly toy", value: 5 , quantity: 130, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 9, description: "Traffic cone", value: 10 , quantity: 900, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 10, description: "Corncob pipe", value: 15 , quantity: 1000, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 10, description: "Sailor hat", value: 50 , quantity: 50, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 11, description: "Ninja turtles action figures", value: 700 , quantity: 4, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 11, description: "Cards FOR Humanity", value: 10 , quantity: 400, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 12, description: "A toaster", value: 50 , quantity: 40, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 12, description: "rolling pin", value: 10 , quantity: 40, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 13, description: "BLender", value: 70 , quantity: 40, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 13, description: "Scooter", value: 70 , quantity: 40, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 14, description: "Walk on part in Eastenders", value: 700 , quantity: 40, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 14, description: "Gunshot wound", value: 700 , quantity: 40, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 15, description: "Psychological trauma", value: 700 , quantity: 40, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 15, description: "Physical trauma", value: 70 , quantity: 40, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 16, description: "A wooden leg", value: 700 , quantity: 40, delivery: "2016-02-25", ships_to: "UK" )
Reward.create(project_id: 16, description: "Pirate costume", value: 700 , quantity: 40, delivery: "2016-02-25", ships_to: "UK" )



Pledge.create(user_id: 2, project_id: 17, value: 73, reward_id: 1, paid: false)
Pledge.create(user_id: 2, project_id: 17, value: 7344, reward_id: 2, paid: false)
Pledge.create(user_id: 3, project_id: 1, value: 10, reward_id: 3)
Pledge.create(user_id: 3, project_id: 5, value: 500, reward_id: 7)
Pledge.create(user_id: 3, project_id: 10, value: 54)
Pledge.create(user_id: 4, project_id: 4, value: 60)
Pledge.create(user_id: 4, project_id: 10, value: 15)
Pledge.create(user_id: 4, project_id: 11, value: 44)
Pledge.create(user_id: 5, project_id: 2, value: 100)
Pledge.create(user_id: 5, project_id: 6, value: 70)
Pledge.create(user_id: 5, project_id: 10, value: 20)






