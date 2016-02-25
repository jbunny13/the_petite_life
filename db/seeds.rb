# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

products =  [
            {name: 'Osprey Ariel 55', category: 'Travel', description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing'},
            {name: 'Osprey Ariel 55', category: 'Travel', description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing'},
            {name: 'Osprey Ariel 55', category: 'Travel', description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing'},
            {name: 'Osprey Ariel 55', category: 'Travel', description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing'},
            {name: 'Osprey Ariel 55', category: 'Travel', description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing'},
            {name: 'Osprey Ariel 55', category: 'Travel', description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing'},
            {name: 'Osprey Ariel 55', category: 'Travel', description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing'},
            {name: 'Osprey Ariel 55', category: 'Travel', description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing'}
            ]

products.each do |product|
  Product.create!(product)
end

users = [
        {email: 'jnguyen72086@gmail.com', password: 'sfs%1w!nning@8009B!', role: 'internal_admin'},
        {email: 'pocketsizeme@gmail.com', password: '89$231qu@driv!um$@%', role: 'user'},
        {email: 'jenny.nguyen720@gmail.com', password: '209#@820fjdsj@!*@F@jjf', role: 'contributor'},
        {email: 'jenny@thepetitelife.com', password: 'fjs083s@34FHs!!fdsf', role: 'moderator'},
        ]

users.each do |user|
  User.create!(user)
end