require 'faker'

namespace :dev do

  desc "Setting the development workspace"
  task setup: :environment do
    images_path = Rails.root.join('public','system')
    puts "Setting up..."

    puts "Dropping database #{%x(rake db:drop)}"
    puts "Deleting Image File From public/system/ #{%x(rm -rf #{images_path})}"
    puts "Creating database #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:generate_admins)
    puts %x(rake dev:generate_members)
    puts %x(rake dev:generate_ads)
    
    puts "Setup completed"
  end



  desc "Create Fake admins"
  task generate_admins: :environment do
    puts "Generating admins"
    10.times do 
      Admin.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email, 
        password: "123456", 
        password_confirmation: "123456",
        role: [0,0,1,1,1,1,1].sample)
    end
    puts "Admins generated"
  end

  

  desc "Create fake members"
  task generate_members: :environment do
    puts "Creating member"
    30.times do
      Member.create!(
        email:Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456"
      )
    end
    puts "Members Created"
  end


  desc "Create fake ads"
  task generate_ads: :environment do
    puts "Creating Adversimnets..."

    3.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: LeroleroGenerator.paragraph([1,2,3].sample),
        member: Member.first,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        finish_date: Date.today + Random.rand(90),
        picture: File.new(Rails.root.join('public', 'img', "#{Random.rand(9)}.jpg"),'r')
      )
    end


    20.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: LeroleroGenerator.paragraph([1,2,3].sample),
        member: Member.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        finish_date: Date.today + Random.rand(90),
        picture: File.new(Rails.root.join('public', 'img', "#{Random.rand(9)}.jpg"),'r')
      )
      end
      puts "Ads successeful created!"
    end


end
