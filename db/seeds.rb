# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(
            :first_name => "Jorge",
            :last_name => "de los Santos",
            :birth => "1983-09-15",
            :dni => 19008736,
            :bloodtype => "A-",
            :gender => "male",
            :city => "Mar del Plata",
            :state => "Buenos Aires",
            :country => "Argentina",
            :email => "tebayoso@gmail.com",
            :password => "testpass"
            )
