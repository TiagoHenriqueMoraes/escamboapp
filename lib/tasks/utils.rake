require 'faker'

namespace :utils do
  desc "Create Fake admins"
  puts "Generating admins"
  task generate_admins: :environment do
    10.times do 
      Admin.create!(email: Faker::Internet.email, 
                    password: "123456", 
                    password_confirmation: "123456")
    end
  end
  puts "Admins generated"
end
