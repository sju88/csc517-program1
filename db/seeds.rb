Admin.create!(name:  "Super Admin",
             email: "super@ncsu.edu",
             password:              "123456",
             password_confirmation: "123456",
             preconfigured: true)

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@ncsu.edu"
  password = "password"
  Admin.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end