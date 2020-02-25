require 'faker'

Office.destroy_all if Rails.env.development?


puts 'Creating 10 fake offices...'
10.times do
  office = Office.new(
    name: Faker::Hipster.sentence(word_count: 3),
    description: Faker::Hipster.sentences,
    city: Faker::Address.city
    address: Faker::Address.street_address,
    start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    end_date: Faker::Date.forward(days: 23),
    max_capacity: rand(1..30),
    price: rand(20..100)
  )
  office.save!
end

puts 'Finished!'

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(
#   first_name: "Anna",
#   last_name: "Herzog",
#   email: "anna.herzog@gmail.com",
#   bio: "Project boss"

#   )

# User.create!(
#   first_name: "Philipp",
#   last_name: "Hamm",
#   email: "philipp.hamm@gmail.com",
#   bio: "Developer"
#   )

User.create!(
  first_name: "Amy",
  last_name: "Lu",
  email: "awesome@yahoo.com" ,
  bio: "smart girl"
  )

# User.create!(
#   first_name: "Ambar" ,
#   last_name: "Galan",
#   email: "yahoo@yahoo.com",
#   bio: "Boss designer"
#   )

# Office.create!(
#   city: "Berlin",
#   start_date: Date.new(2001,2,3) ,
#   end_date: Date.new(2002,2,3) ,
#   address: "Ridwer Strasse 23",
#   max_capacity: 3 ,
#   price: 23,
#   description: "Great flat"
#   )

# Office.create!(
#   city: "Berlin",
#   start_date: Date.new(2000,2,3) ,
#   end_date: Date.new(2002,2,3) ,
#   address: "Haus Strasse 23",
#   max_capacity: 7 ,
#   price: 46,
#   description: "Awesome flat"
#   )
