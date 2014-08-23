# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

f = File.open('bancos.csv', 'r')
f.each_line do |l|
  Ong.new(  name: l[],
            street1: l[],
            street2: l[],
            city: l[],
            state: l[],
            country: l[],
            zip: l[],
            phone: l[],
            email: l[],
            website: l[],
            facebook: l[],
            twitter: l[],
            national_network: l[],
            international_network: l[],
            comments: l[],
            latitude: l[],
            longitude: l[],
            ourmark_id: l[]
          )
end