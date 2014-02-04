# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! :email => "sam.clvrt@gmail.com", :password => "1234567890"

Category.create! :name => "News"
Category.create! :name => "Sports"
Category.create! :name => "Satire"
Category.create! :name => "Opinion"
Category.create! :name => "Features"
Category.create! :name => "Entertainment"
Category.create! :name => "Editorials"
