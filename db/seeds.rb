# Cleaning DB
p "Cleaning DB..."
User.destroy_all
p "Cleaning done"

# Create a main sample user.
p "Creating main user..."
User.create!(name:  "Nicolas de Guilhem",
             email: "nicolas.dgdl@hotmail.fr",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)
p "Main user created"

# Generate a bunch of additional users.
p "Creating all other users..."
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
              email: email,
              password:              password,
              password_confirmation: password)
end
p "All other users created"
