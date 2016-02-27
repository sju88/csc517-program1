== README

Class Portal Web Application using Ruby on Rails


* Ruby version: 4.2.2

* System dependencies: see Gemfile

* Configuration: 
-----------------------------------------------
User Type   ||   User Name     || email                  || password
-----------------------------------------------
Admin       ||   Super Admin   || superadmin@ncsu.edu    ||123456
-----------------------------------------------
Student     ||   student1      || student1@ncsu.edu      ||123456
-----------------------------------------------
Instructor  ||   instructor1   || instructor1@ncsu.edu   ||123456
-----------------------------------------------

* Database creation:

 - Admin
 - Student
 - Instructor
 - Course
 - Course_Material
 - Course_Instructor
 - Enrollment


* Database initialization:

 - bundle exec rake db:migrate
 - bundle exec rake db:rollback
 - bundle exec rake db:migrate VERSION=0
 - heroku pg:reset DATABASE
 - heroku run rake db:seed
 - heroku restart


* Deployment instructions:

 - rails server -b $IP -p $PORT (on cloud9)
 - rails server (on local computer)


