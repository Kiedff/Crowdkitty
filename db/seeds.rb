# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


site_admin = User.create(name: "site_admin", email: "admin@admin.admin", password: "password", role: 'admin')
ada = User.create(name: "ada", email: "ada@email.example", password: 'password', role: 'user')
obedia = User.create(name: "obedia", email: "obedia@email.example", password: 'password', role: 'user')
tristan = User.create(name: "tristan", email: "tristan@email.example", password: 'password', role: 'user')
isolde = User.create(name: "isolde", email: "isolde@email.example", password: 'password', role: 'user')

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

ada.projects.new(name: 'skatepark', summary: 'a new skatepark in edinburgh', target: '5000', start_date: '2015-12-25', end_date: '2015-3-25', location: 'edinburgh', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', category_id: 1).save

ada.projects.new(name: 'skate shoes', summary: 'rad skate shoes', target: '1000', start_date: '2015-12-24', end_date: '2015-2-25', location: 'edinburgh', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', category_id: 3).save

obedia.projects.new(name: 'space boots', summary: 'walk around on the moon', target: '5000', start_date: '2015-12-24', end_date: '2015-2-25', location: 'edinburgh', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', category_id: 3).save

obedia.projects.new(name: 'spacerocket', summary: "we're going to mars!", target: '5000000', start_date: '2016-01-25', end_date: '2015-2-25', location: 'glasgow', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', category_id: 2).save

obedia.projects.new(name: 'low gravity jet pack', summary: "fly around on the moon!", target: '100000', start_date: '2015-12-19', end_date: '2015-5-25', location: 'glasgow', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', category_id: 2).save

Project.first.rewards.new(description: 'free skateboard', value: '50', quantity: 20, delivery: '2015-04-01', ships_to: 'uk').save


Project.last.rewards.new(description: 'spacesuit', value: '1000', quantity: 5, delivery: '2015-12-01', ships_to: 'worldwide').save

tristan.pledges.new(project_id: 1, value: 75, reward_id: 1).save
isolde.pledges.new(project_id: 2, value: 2500, reward_id: 2).save
