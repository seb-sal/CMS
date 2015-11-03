
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Company.destroy_all
CompanyContact.destroy_all
User.destroy_all

company_list = [
  {
    company_id:"0001",
    count: 1,
    company_name:"Ironman World Headquarters",
    company_size:15_000,
    company_type:"Sporting Events",
    telephone:"(303) 444-4316",
    logo_uri:"https://i.imgur.com/raNU3QX.jpg",
    # fax:"",
    address:"2701 North Rocky Point Dr",
    city:"Tampa",
    state:"FL",
    country:"USA",
    zip_code:"33131",
    website_uri:"http://www.ironman.com/",
    facebook_uri:"https://www.facebook.com/Ironmantri",
    email:"athleteservices@ironman.com",
    linkedin_uri:"https://goo.gl/DnYQnf"
  },

  {
    company_id: "00002",
    count: 2,
    company_name:"Garmin",
    company_size:5_500 ,
    company_type:"Sporting Electronics",
    telephone:"(714) 338-1933",
    logo_uri:"https://i.imgur.com/tP5Vhn5.png",
    # fax:"",
    address:"2700 Park Ave",
    city:"Tustin",
    state:"CA",
    country:"USA",
    zip_code:"92682",
    website_uri:"http://www.garmin.com/en-US",
    facebook_uri:"https://www.facebook.com/Garmin/",
    email:"info@garmin.com",
    linkedin_uri:"https://goo.gl/ICJni6"
  },

  {
    company_id:"0003" ,
    count: 3,
    company_name:"Cervelo Bikes",
    company_size: 17_000,
    company_type:"Sporting Equipment",
    telephone:"(703) 280-2248",
    logo_uri:"https://i.imgur.com/XmZBlex.jpg",
    # fax:"",
    address:"2822 Fallfax Drive",
    city:"Falls Church",
    state:"VA",
    country:"USA",
    zip_code:"22042",
    website_uri:"http://www.cervelo.com/en/",
    facebook_uri:"https://www.facebook.com/cervelo",
    email:"info@cervelobikes.com",
    linkedin_uri:"https://goo.gl/VlGxE8"
  },
]

contacts_list = [
    {
    company_contact_id:"1",
     # date_created:
     profile_pic_uri:"",
     name:"Giorgio Fanucchi",
     username:"giorgio_fhi",
     password:"pass123",
     email:"giorgio@cervelo.com",
     office_number:"(305) 905-3724",
     cellphone_number:"1-800-CERVELO",
     job_title:"General Manager"
    },

    {
    company_contact_id:"2",
     # date_created:
     profile_pic_uri:"",
     name:"Mateo Salazar",
     username:"mateo_salazar",
     password:"pass123",
     email:"mat@garmin.com",
     office_number:"1-800-GARMIN",
     cellphone_number:"(305) 905-3725",
     job_title:"Senior Business Developer Franchiser"
    },

    {
    company_contact_id:"3",
     # date_created:
     profile_pic_uri:"",
     name:"Michael Lemus",
     username:"michael_lemus",
     password:"pass123",
     email:"michael@ironman.com",
     office_number:"1-800-IRONMAN",
     cellphone_number:"(305) 905-3777",
     job_title:"Chief Marketing Officer"
    },
]

user_list = [
    {
      name:"Sebastian Salazar",
      email:"sebastian@hikeit.technology",
      # username:"sebastian@hikeit.technology",
      password:"pass123",
      password_confirmation: "pass123"
    },

    {
      name:"Micheal Lemus",
      email:"michael@hikeit.technology",
      # username:"michael@hikeit.technology",
      password:"pass123",
      password_confirmation: "pass123"
    },

    {
      name:"Darshan Dalal",
      email:"darshan@systemcatalyst.com",
      # username:"darshan@systemcatalyst.com",
      password:"pass123",
      password_confirmation: "pass123"
    },
]



Company.create company_list
CompanyContact.create contacts_list
User.create user_list

Company.all.first.company_contacts << CompanyContact.all.first
