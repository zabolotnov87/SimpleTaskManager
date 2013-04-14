# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'admin@mail.com', password: 'secret')
User.create(email: 'mike@mail.com', password: 'secret')
User.create(email: 'adam@mail.com', password: 'secret')
