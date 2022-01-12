# Create a main sample user.
p "Creating main user..."
User.create!(name:  "Nicolas de Guilhem",
             email: "nicolas.dgdl@hotmail.fr",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
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
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
p "All other users created"

# Generate microposts for a subset of users.
p "Creating microposts..."
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end
p "Microposts created"
