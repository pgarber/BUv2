namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    clear_db
    make_users
    # make_microposts
    # make_relationships
    make_companies
    make_feedbacks
    make_company_employees
    make_projects
    make_project_feedbacks
  end
end

# not generated here:
#   attributes and project_attributes are in seeds.rb
#   ratings and project_ratings are created by rake db:crunch_ratings

def clear_db
  users = User.all
  users.delete_all
  companies = Company.all
  companies.delete_all
  feedbacks = Feedback.all
  feedbacks.delete_all
  co_emp = CompanyEmployee.all
  co_emp.delete_all
  projects = Project.all
  projects.delete_all
  proj_fb = ProjectFeedback.all
  proj_fb.delete_all
end


def make_users
  admin = User.create!(name: "Example User",
                 email: "example@example.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@example.com"
    password  = "password"
    User.create!(name: name,   
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end

# def make_microposts
#   users = User.all(limit: 6)
#   50.times do
#     content = Faker::Lorem.sentence(5)
#     users.each { |user| user.microposts.create!(content: content) }
#   end
# end

# def make_relationships
#   users = User.all
#   user  = users.first
#   followed_users = users[2..50]  # is this id 2, or 2nd in the table?
#   followers      = users[3..40]
#   followed_users.each { |followed| user.follow!(followed) }
#   followers.each      { |follower| follower.follow!(user) }
# end

def make_companies
  Company.create!(domain: "example.com", name: "Example" )
end

def make_feedbacks
  users = User.all
  Feedback.create!(from_id: users.first.id, to_id: users.last.id, attribute_identifier: "5")
  Feedback.create!(from_id: users.first.id, to_id: users.last.id, attribute_identifier: "6")
  Feedback.create!(from_id: users.first.id, to_id: users.last.id, attribute_identifier: "1")
  Feedback.create!(from_id: users.first.id, to_id: users.last.id, attribute_identifier: "1001", rating_given: "8")
end

#not sure why I need to do this because I think make_users should call User.create, but it seems not to.
def make_company_employees  # need your company (example.com) to already exist in  Company table
  users = User.all 
  companies=Company.all
  users.each do |user|
    domain = user.email.split("@").last
    company_id = companies.find_by(domain: domain).id
    CompanyEmployee.create!(company_id:(companies.find_by(domain: domain).id), user_id: user.id)
  end
end

def make_projects
  companies = Company.all
  company_id = companies.first.id 
  Project.create!(name: "Factory cost reduction", company_id: company_id)
  Project.create!(name: "Competitor acquisition", company_id: company_id)
end

# project_attributes is in seeds.rb

def make_project_feedbacks
  users = User.all
  projects = Project.all
  ProjectFeedback.create!(from_id: users.first.id, to_project_id: projects.first.id, project_attribute_identifier: "1", rating_given: "7")
  ProjectFeedback.create!(from_id: users.first.id, to_project_id: projects.first.id, project_attribute_identifier: "1", rating_given: "4")
  ProjectFeedback.create!(from_id: users.first.id, to_project_id: projects.first.id, project_attribute_identifier: "2", rating_given: "5")
end




