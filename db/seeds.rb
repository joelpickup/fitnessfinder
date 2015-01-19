# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(first_name:"Hannah", last_name:"Mills", email:"hannah@ga.com", password:"password", role: "instructor")
User.create!(first_name:"Tony", last_name:"Goncalves", email:"tony@ga.com", password:"password", role: "instructor")
User.create!(first_name:"Joel", last_name:"Pickup", email:"joel@ga.com", password:"password", role: "instructor")
User.create!(first_name:"Julia", last_name:"Mansson", email:"julia@ga.com", password:"password", role: "instructor")
User.create!(first_name:"Sebastian", last_name:"Riddle", email:"sebastian@ga.com", password:"password", role: "client")
User.create!(first_name:"Sadiq", last_name:"Okocha", email:"sadiq@ga.com", password:"password", role: "client")
User.create!(first_name:"Nina", last_name:"Regli", email:"nina@ga.com", password:"password", role: "client")
User.create!(first_name:"Sophie", last_name:"Allaoua", email:"sophie@ga.com", password:"password", role: "client")
User.create!(first_name:"Luke", last_name:"Grayland", email:"luke@ga.com", password:"password", role: "client")
User.create!(first_name:"Bruno", last_name:"Vinel", email:"bruno@ga.com", password:"password", role: "client")
User.create!(first_name:"Lisa", last_name:"Pollack", email:"lisa@ga.com", password:"password", role: "client")
User.create!(first_name:"Neil", last_name:"Crosbourne", email:"neil@ga.com", password:"password", role: "client")
User.create!(first_name:"Rabea", last_name:"Gleissner", email:"rabea@ga.com", password:"password", role: "client")
User.create!(first_name:"Andres", last_name:"Vara", email:"andres@ga.com", password:"password", role: "client")
User.create!(first_name:"Daniel", last_name:"Easterman", email:"daniel@ga.com", password:"password", role: "client")
User.create!(first_name:"Michael", last_name:"Pavling", email:"michael@ga.com", password:"password", role: "client")
User.create!(first_name:"Jarkyn", last_name:"S", email:"jarkyn@ga.com", password:"password", role: "client")
User.create!(first_name:"Alex", last_name:"Chin",  email:"alex@ga.com", password:"password", role: "client")
User.create!(first_name:"Johanna", last_name:"Carlberg", email:"johanna@ga.com", password:"password", role: "client")
User.create!(first_name:"Guy", last_name:"Routledge", email:"guy@ga.com", password:"password", role: "client")

Lesson.create!(name:"Weights", description:"Heavy weights training", price: 20, instructor_id: 2, duration: 30)
Lesson.create!(name:"Water Aerobics", description:"not just for pregnant / old people!", price: 20, instructor_id: 1, duration: 45)
Lesson.create!(name:"Cross Fit", description:"forging elite fitness!", price: 15, instructor_id: 3, duration: 30)
Lesson.create!(name:"Pilates", description:"sort of like yoga but not", price: 30, instructor_id: 4, duration: 60)

Booking.create(lesson_id:"1", start_time:"", status:"unapproved", instructor_id:"2", client_id:"6")
Booking.create(lesson_id:"2", start_time:"", status:"unapproved", instructor_id:"1", client_id:"9")
Booking.create(lesson_id:"3", start_time:"", status:"unapproved", instructor_id:"3", client_id:"10")
Booking.create(lesson_id:"4", start_time:"", status:"unapproved", instructor_id:"4", client_id:"11")

Comment.create!(title:"Great teacher", comment:"Joel is awesome!", commentable_id: 3, user_id:5)
Comment.create!(title:"Enthusiastic but too intense", comment:"had a good time on my kickboxing lesson with joel, he was passionate and enthusiastic, but I could have done with him slowing down a bit", commentable_id: 3, user_id:7)
Comment.create!(title:"Fun student!", comment:"Nina was great, dealt well with everything i threw at her", commentable_id: 7, user_id:3)
Comment.create!(title:"Great teacher", comment:"Hannah is awesome!", commentable_id: 1, user_id:10)


