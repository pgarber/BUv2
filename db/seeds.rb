# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Attribute.create(attribute_name: 'Technical guru', good: 'true', opposite_id: 2)
#Attribute.create(attribute_name: 'Needs to gain experience', good: 'false', opposite_id: 1)
# then run $ rake db:setup ?
# $ rake db:reset           ?
# $ rake db:populate        ?
# don't need: $ rake test:prepare   ?
# restart rails server 

# before re-seeding, need to make sure the tables are empty or there will be a uniqueness error
# rails console
# > attrib = Attribute.all
# > attrib.delete_all
# > exit
# rake db:seed

attribute_list = [
  [ 1, "Technical guru", 'true', 2 ],
  [ 2, "Needs to gain experience", 'false', 1 ],
  [ 3, "Photographic memory", 'true', 4 ],
  [ 4, "Needs better follow up on actions", 'false', 3 ],
  [ 5, "Brilliant", 'true', 6 ],
  [ 6, "Needs to build credibility with employees", 'false', 5 ],
  [ 7, "Big picture thinker", 'true', 8 ],
  [ 8, "Needs to see the forest for the trees", 'false', 7 ],
  [ 9, "Polished presentation", 'true', 10 ],
  [ 10, "Needs more professional presentation", 'false', 9 ],
  [ 11, "CEO potential", 'true', 12 ],
  [ 12, "Needs to demonstrate potential", 'false', 11 ],
  [ 13, "Deserves a promotion", 'true', 14 ],
  [ 14, "Needs a role with a better fit", 'false', 13 ],
  [ 15, "Positive attitude", 'true', 16 ],
  [ 16, "Needs to improve attitude", 'false', 15 ],
  [ 17, "Team player", 'true', 18 ],
  [ 18, "Needs to work more effectively with team", 'false', 17 ],
  [ 19, "Honest", 'true', 20 ],
  [ 20, "Needs to be more forethright in dealings", 'false', 19 ],
  [ 21, "Inspires people", 'true', 22 ],
  [ 22, "Needs to inspire with credible vision", 'false', 21 ],
  [ 23, "Inspires people", 'true', 24 ],
  [ 24, "Needs to give credit where due", 'false', 23 ],
  [ 25, "Life of the party / meeting", 'true', 26 ],
  [ 26, "Needs to build better rapport", 'false', 25 ],
  [ 27, "Employees love him/her", 'true', 28 ],
  [ 28, "Needs more reasonable expectations", 'false', 27 ],
  [ 29, "Leads by example", 'true', 30 ],
  [ 30, "Needs to practice what he/she preaches", 'false', 29 ],
  [ 31, "Walks the walk", 'true', 32 ],
  [ 32, "Needs to put in put in more effort", 'false', 31 ],
  [ 33, "Hires well", 'true', 34 ],
  [ 34, "Needs to improve hiring", 'false', 33 ],
  [ 35, "Communicates clearly", 'true', 36 ],
  [ 36, "Needs to communicate more clearly", 'false', 35 ],
  [ 37, "Personable and well liked", 'true', 38 ],
  [ 38, "Needs better relationship with coworkers", 'false', 37 ],
  [ 39, "Markets self well", 'true', 40 ],
  [ 40, "Needs to communicate contributions", 'false', 39 ],
  [ 41, "Good customer rapport", 'true', 42 ],
  [ 42, "Needs to build credibility with clients", 'false', 41 ],
  [ 43, "Voice for the customer", 'true', 44 ],
  [ 44, "Needs to advocate for customer", 'false', 43 ],
  [ 45, "Knows the market", 'true', 46 ],
  [ 46, "Needs better market understanding", 'false', 45 ],
  [ 47, "Rainmaker", 'true', 48 ],
  [ 48, "Needs to win more business", 'false', 47 ],
  [ 49, "Dependable", 'true', 50 ],
  [ 50, "Needs to deliver on commitments", 'false', 49 ],
  [ 51, "Tireless worker", 'true', 52 ],
  [ 52, "Needs to apply self more", 'false', 51 ],
  [ 53, "Meets and beats deadlines", 'true', 54 ],
  [ 54, "Needs to complete work more quickly", 'false', 53 ],
  [ 55, "In early / stays late", 'true', 56 ],
  [ 56, "Needs to avoid kissing up", 'false', 55 ],
  [ 57, "Laser focus on task at hand", 'true', 58 ],
  [ 58, "Needs to avoid distractions", 'false', 57 ],
  [ 59, "Finds a way to win", 'true', 60 ],
  [ 60, "Needs to not rest on laurels", 'false', 59 ],
  [ 61, "Ambitious", 'true', 62 ],
  [ 62, "Needs to show more ambition", 'false', 61 ],
  [ 63, "Goes above and beyond", 'true', 64 ],
  [ 64, "Needs to do more than is asked", 'false', 63 ],

  [ 1001, "Results", '1to10', 999],
  [ 1002, "Job Knowledge", '1to10', 999],
  [ 1003, "Initiative", '1to10', 999],
  [ 1004, "Communication", '1to10', 999],
  [ 1005, "Leadership", '1to10', 999]
]

attribute_list.each do |identifier, attribute_name, good, opposite_identifier|
  Attribute.create( identifier: identifier, attribute_name: attribute_name, 
                  good: good, opposite_identifier: opposite_identifier )
end

project_attribute_list = [
  [ 1, "Strategy" ],   # for now, leave out project_id because strategy and execution will be applied to all
  [ 2, "Execution" ]
  ]

project_attribute_list.each do |id, project_attribute_name|
  ProjectAttribute.create( identifier: id, project_attribute_name: project_attribute_name )
end
