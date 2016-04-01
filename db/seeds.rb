# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
   User.create!(email: "#{Faker::Name.first_name}@123.com", password: 123456)
end

10.times do |i|
   Band.create!(name: Faker::Hipster.word.capitalize)
   (rand(6) + 3).times do |j|
      Album.create!(band_id: (i + 1),
                   title: Faker::Hipster.words(2).map(&:capitalize).join(" "),
                   album_type: ["live", "studio"].sample)
      (rand(6) + 4).times do
         Track.create!(album_id: (j + 1),
                      title: Faker::Hipster.word.capitalize,
                      lyrics: Faker::Hipster.paragraphs.join("\n"),
                      bonus: (["regular"] * 4 + ["bonus"]).sample
                      )
      end
   end
end
