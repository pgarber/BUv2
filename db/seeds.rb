# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Attribute.create(attribute_name: 'Technical guru', good: 'true', opposite_id: 2)
#Attribute.create(attribute_name: 'Needs to gain experience', good: 'false', opposite_id: 1)
# then run $ rake db:setup
# $ rake db:reset
# $ rake db:populate
# don't need: $ rake test:prepare
# restart rails server


attribute_list = [
  [ "Technical guru", 'true', 2 ],
  [ "Needs to gain experience", 'false', 1 ],
  [ "Photographic memory", 'true', 4 ],
  [ "Needs better follow up on actions", 'false', 3 ],
  [ "Brilliant", 'true', 6 ],
  [ "Needs to build credibility with employees", 'false', 5 ],
  [ "Big picture thinker", 'true', 8 ],
  [ "Needs to see the forest for the trees", 'false', 7 ],
  [ "Polished presentation", 'true', 10 ],
  [ "Needs more professional presentation", 'false', 9 ],
  [ "CEO potential", 'true', 12 ],
  [ "Needs to demonstrate potential", 'false', 11 ],
  [ "Deserves a promotion", 'true', 14 ],
  [ "Needs a role with a better fit", 'false', 13 ],
  [ "Positive attitude", 'true', 16 ],
  [ "Needs to improve attitude", 'false', 15 ],
  [ "Team player", 'true', 18 ],
  [ "Needs to work more effectively with team", 'false', 17 ],
  [ "Honest", 'true', 20 ],
  [ "Needs to be more forethright in dealings", 'false', 19 ],
  [ "Inspires people", 'true', 22 ],
  [ "Needs to inspire with credible vision", 'false', 21 ],
  [ "Inspires people", 'true', 24 ],
  [ "Needs to give credit where due", 'false', 23 ],
  [ "Life of the party / meeting", 'true', 26 ],
  [ "Needs to build better rapport", 'false', 25 ],
  [ "Employees love him/her", 'true', 28 ],
  [ "Needs more reasonable expectations", 'false', 27 ],
  [ "Leads by example", 'true', 30 ],
  [ "Needs to practice what he/she preaches", 'false', 29 ],
  [ "Walks the walk", 'true', 32 ],
  [ "Needs to put in put in more effort", 'false', 31 ],
  [ "Hires well", 'true', 34 ],
  [ "Needs to improve hiring", 'false', 33 ],
  [ "Communicates clearly", 'true', 36 ],
  [ "Needs to communicate more clearly", 'false', 35 ],
  [ "Personable and well liked", 'true', 38 ],
  [ "Needs better relationship with coworkers", 'false', 37 ],
  [ "Markets self well", 'true', 40 ],
  [ "Needs to communicate contributions", 'false', 39 ],
  [ "Good customer rapport", 'true', 42 ],
  [ "Needs to build credibility with clients", 'false', 41 ],
  [ "Voice for the customer", 'true', 44 ],
  [ "Needs to advocate for customer", 'false', 43 ],
  [ "Knows the market", 'true', 46 ],
  [ "Needs better market understanding", 'false', 45 ],
  [ "Rainmaker", 'true', 48 ],
  [ "Needs to win more business", 'false', 47 ],
  [ "Dependable", 'true', 50 ],
  [ "Needs to deliver on commitments", 'false', 49 ],
  [ "Tireless worker", 'true', 52 ],
  [ "Needs to apply self more", 'false', 51 ],
  [ "Meets and beats deadlines", 'true', 54 ],
  [ "Needs to complete work more quickly", 'false', 53 ],
  [ "In early / stays late", 'true', 56 ],
  [ "Needs to avoid kissing up", 'false', 55 ],
  [ "Laser focus on task at hand", 'true', 58 ],
  [ "Needs to avoid distractions", 'false', 57 ],
  [ "Finds a way to win", 'true', 60 ],
  [ "Needs to not rest on laurels", 'false', 59 ],
  [ "Ambitious", 'true', 62 ],
  [ "Needs to show more ambition", 'false', 61 ],
  [ "Goes above and beyond", 'true', 64 ],
  [ "Needs to do more than is asked", 'false', 63 ],

  [ "Results", '1to10', 999],
  [ "Job Knowledge", '1to10', 999],
  [ "Initiative", '1to10', 999],
  [ "Communication", '1to10', 999],
  [ "Leadership", '1to10', 999]


]

attribute_list.each do |attribute_name, good, opposite_id|
  Attribute.create( attribute_name: attribute_name, good: good, opposite_id: opposite_id )
end