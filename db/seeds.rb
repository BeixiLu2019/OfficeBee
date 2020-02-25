# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# # User.create!(
# #   first_name: "Anna",
# #   last_name: "Herzog",
# #   email: "anna.herzog@gmail.com",
# #   bio: "Project boss"

# #   )

# # User.create!(
# #   first_name: "Philipp",
# #   last_name: "Hamm",
# #   email: "philipp.hamm@gmail.com",
# #   bio: "Developer"
# #   )

# # User.create!(
# #   first_name: "Amy",
# #   last_name: "Lu",
# #   email: "awesome@yahoo.com" ,
# #   bio: "smart girl"
# #   )

# # User.create!(
# #   first_name: "Ambar" ,
# #   last_name: "Galan",
# #   email: "yahoo@yahoo.com",
# #   bio: "Boss designer"
# #   )

Office.create!(
  city: "Berlin",
  start_date: Date.new(2000,2,3) ,
  end_date: Date.new(2002,2,3) ,
  address: "Haus Strasse 23",
  max_capacity: 7 ,
  price: 46,
  description: "Awesome flat"
  )
