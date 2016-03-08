# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

products =  [
            {name: 'Osprey Ariel 55 (Internal Admin)', description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing', user_id: '1'},
            {name: 'Osprey Ariel 55 (User)', description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing', user_id: '2'},
            {name: 'Osprey Ariel 55 (Contributor)', description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing', user_id: '3'},
            {name: 'Osprey Ariel 55 (Moderator)', description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing', user_id: '4'},
            {name: 'Osprey Ariel 55', description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing', user_id: '1'},
            {name: 'Osprey Ariel 55', description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing', user_id: '2'},
            {name: 'Osprey Ariel 55', description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing', user_id: '3'},
            {name: 'Osprey Ariel 55', description: 'Testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing testing', user_id: '4'}
            ]

products.each do |product|
  Product.create!(product)
end

users = [
        {first_name: 'Internal Admin', last_name: 'Nguyen', email: 'jnguyen72086@gmail.com', password: 'sfs%1w!nning@8009B!', role: 'internal_admin'},
        {first_name: 'User', last_name: 'Nguyen', email: 'pocketsizeme@gmail.com', password: '89$231qu@driv!um$@%', role: 'user'},
        {first_name: 'Contributor', last_name: 'Nguyen', email: 'jenny.nguyen720@gmail.com', password: '209#@820fjdsj@!*@F@jjf', role: 'contributor'},
        {first_name: 'Moderator', last_name: 'Nguyen', email: 'jenny@thepetitelife.com', password: 'fjs083s@34FHs!!fdsf', role: 'moderator'},
        ]

users.each do |user|
  User.create!(user)
end