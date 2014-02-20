# Ruby on Rails Tutorial: sample application
Phil Garber

This is the sample application for
the [*Ruby on Rails Tutorial*](http://railstutorial.org/)
by [Michael Hartl](http://michaelhartl.com/).

views from divshot:
homepage.html went into users/_homepage.html.erb
myfeedback went into users/show.html.erb - now put it in users/myfeedback
landing.html went into shared/_landing.html.erb  -> now put in static_pages/_landing
leaderboard.html went into users/leaderboard.html (should it be a partial?)
give_feedback.html went into static_pages/give_feedback.html.erb -> now in show.html.erb

try to do better design with shared/_signed_in_sidebar.html.erb

to do:
- anyone signed in user can see other users' full feedback 
  redirect to homepage if they try to do that
- 

2/5/14: created Attributes controller and Attribute model
		created Feedbacks controller and Feedback model

NOW WORKING in code/BUv2 - still called branch BU_hartl (and sample app still has a BU_hartl but I checked out)		

- add ember.js and Addepar for graphing.  put Handlebars and ember.js 1.3 into code/BUv2/vendor.  load them in layouts/application.html.erb

Things I did
$ rails generate controller Attributes --no-test-framework
$ rails generate model Attribute attribute_name:string good:binary opposite_id:integer
$ rake db:migrate

$ rails g migration add_ratings_to_users ratings:array
$ rake db:migrate

$ rake db:crunch_ratings

$ rails g migration change_ratings_format_in_users_table

create branch screwed_up_db - just in case I make things even worse than they are now.


THINGS I DONT UNDERSTAND
- edit.html.erb: f.password ... f.submit

ran git checkout -b old-state ...
and now things are working OK (other than not being able to change my db structure and rake db:crunch_ratings fails) so I merged this back into branch BU_hartl

Try changing ratings column to type TEXT in SQLite DB Browser

It's finally on github.  for some reason, it wasn't happy with the existing publickey.


MESSING WITH DB:
rake db:drop
rake db:migrate (make sure password stuff is not commented out)
rake db:populate  // puts all the Hartl stuff like users in
rake db:seed      // puts my attributes list in the db
rails generate migration add_ratings_to_users ratings:hash
rake db:migrate
  try new db format:
rails generate controller Ratings --no-test-framework
rails generate model Rating user_id:integer attribute_id:integer current_rating:float
rake db:migrate


rake db:crunch_ratings

so, Users still has a ratings column, but it's not being used.  I'm just having trouble deleting it

I can't figure out a way to debug the javascript for Google Charts.  So try chartkick which uses javascript, but only requires me to write in ruby.


2/17/14.  Add slider bar functionality.  Need 1to10 ratings in models & controllers
$ rails g migration add_rating_given_to_feedbacks rating_given:float
$ rake db:migrate
put 1to10 ratings in seeds
$ rake db:seed // put the attributes in again - delete them first
$ rails console

# This method works now that I'm working off of identifier rather than id
> attrib = Attribute.all
> attrib.delete_all  // this doesnt' reset id to 1 when you reseed.  Do following instead

> ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'attributes'")
$ rake db:seed

changed to Simplex theme by Bootswatch by replacing custom.css.scss contents with that of bootstrap.css from bootswatch.com Simplex theme

Got sliders working, merged back to main.  John is helping with unit tests

$ rails g migration AddAttributeIdentifier   # then put 4 lines in new migrations file
$ rake db:migrate
$ rails g migration ChangeOppositeidName # had to do another migration because I already ran the previous migration
$ rake db:migrate
# update seeds.rb
$ rake db:seed


Now, add Companies  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
$ git checkout -b companies
$ rails g controller Companies new --no-test-framework
$ rails g model Company domain:string name:string

$ rails g controller Company_employees new --no-test-framework
$ rails g model Company_employee company_id:integer user_id:integer user_in_group:hash
 # I should either do CompanyEmployee or company_employee.  Not Company_employee
destroy these (destroy controller, destroy model, g migration to drop_table) and do
$ rails g controller CompanyEmployees new --no-test-framework
$ rails g model CompanyEmployee company_id:integer user_id:integer
