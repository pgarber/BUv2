namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
    make_companies
    make_feedbacks
    make_projects
    make_project_feedbacks
    make_company_employees
  end
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

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }


end

def make_companies
  Company.create!(domain: example.com, name: Example )
end

def make_feedbacks
  Feedbacks.create!(from_id: "1", to_id: "2", attribute_identifier: "5")
  Feedbacks.create!(from_id: "4", to_id: "2", attribute_identifier: "5")
  Feedbacks.create!(from_id: "8", to_id: "2", attribute_identifier: "6")
  Feedbacks.create!(from_id: "1", to_id: "2", attribute_identifier: "1")
  Feedbacks.create!(from_id: "1", to_id: "2", attribute_identifier: "1001", rating: "8")
end

def make_projects
  Project.create!(name: "Factory cost reduction", domain_id: "1")
  Project.create!(name: "Competitor acquisition", domain_id: "1")
end

def make_project_attributes
  ProjectAttributes.create!()
def make_project_feedbacks
  Project.create!(com)

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
