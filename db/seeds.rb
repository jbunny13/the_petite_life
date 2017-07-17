# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
  {first_name: 'User', last_name: 'Nguyen', email: 'user@gmail.com', password: 'pass#word1!', role: 'user'},
  {first_name: 'Contributor', last_name: 'Nguyen', email: 'contributor@gmail.com', password: 'pass#word1!', role: 'contributor'},
  {first_name: 'Moderator', last_name: 'Nguyen', email: 'moderator@gmail.com', password: 'pass#word1!', role: 'moderator'},
  {first_name: 'Internal Admin', last_name: 'Nguyen', email: 'internaladmin@gmail.com', password: 'pass#word1!', role: 'internal_admin'}
].map do |user|
  ap "Creating user:"
  ap user.inspect
  User.create!(user)
end

products =  [
  {
    name: "Osprey Ariel 55 (#{users[0].first_name})",
    description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing',
    user: users[0]
  },
  {
    name: "Osprey Ariel 55 (#{users[1].first_name})",
    description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing',
    user: users[1]
  },
  {
    name: "Osprey Ariel 55 (#{users[2].first_name})",
    description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing',
    user: users[2]
  },
  {
    name: "Osprey Ariel 55 (#{users[3].first_name})",
    description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing',
    user: users[3]
  }
].map do |product|
  Product.create!(product)
end
