Admin.create!(name:  "Example Admin",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             preconfigured: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  Admin.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end