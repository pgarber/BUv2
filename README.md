# Ruby on Rails Tutorial: sample application
Phil Garber

This is the sample application for
the [*Ruby on Rails Tutorial*](http://railstutorial.org/)
by [Michael Hartl](http://michaelhartl.com/).

views from divshot:
homepage.html went into users/_homepage.html.erb
myfeedback went into users/show.html.erb - now put it in users/myfeedback
landing.html went into shared/_landing.html.erb
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