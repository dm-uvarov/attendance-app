# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Faker::Name.unique.clear # Clears used values for Faker::Name
Faker::UniqueGenerator.clear
User.delete_all
Student.delete_all
Discipline.delete_all
Slot.delete_all
Appointment.delete_all
Attendance.delete_all



p "start"
45.times { 
    name = Faker::Name.unique.name
    email = "#{name.split(" ").join("")}@gmail.com"
    pic = Faker::Avatar.image
    Student.create(name: name, email: email, pic: pic)
 }

 p "students"


User.create(username: "alpha", password:"123", name:"John Doe", email:"john@example.com", pic:Faker::Avatar.image, is_instructor: true); 
User.create(username: "omega", password:"123", name:"Jane Doe", email:"jane@example.com", pic:Faker::Avatar.image, is_instructor: true);
User.create(username: "delta", password:"123", name:"Don Doe", email:"Don@example.com", pic:Faker::Avatar.image, is_instructor: true);

p "users"

# 5.times { 
#     name = Faker::Science.science(:basic)
#     id = User.all.sample.id
#     Discipline.create(name: name,pic: Faker::LoremFlickr.image(search_terms: ['college']),user_id: id )
# }
p "discpilpine"
Discipline.create(name: "Human Geography",pic: "https://loremflickr.com/cache/resized/65535_51156211235_9fe4debdcf_300_300_nofilter.jpg",user_id:  User.all.sample.id )
Discipline.create(name: "Human Public Speaking",pic: "https://loremflickr.com/cache/resized/888_42764257401_988259375d_300_300_nofilter.jpg",user_id:  User.all.sample.id )
Discipline.create(name: "Making Friends With Humans",pic: "https://loremflickr.com/cache/resized/1478_26187355085_1585a45b82_300_300_nofilter.jpg",user_id:  User.all.sample.id )
Discipline.create(name: "Structural Art",pic: "https://loremflickr.com/cache/resized/3879_14400470234_f261b91810_300_300_nofilter.jpg",user_id:  User.all.sample.id )
Discipline.create(name: "Wild Cats",pic: "https://loremflickr.com/cache/resized/65535_51536081755_1f6c4564ce_300_300_nofilter.jpg",user_id:  User.all.sample.id )
Discipline.create(name: "Architectural Abstraction",pic: "https://loremflickr.com/cache/resized/7303_16313759217_5fea27ae7f_300_300_nofilter.jpg",user_id:  User.all.sample.id )



5.times { 
    date = Date.new(2022,4, [11,12,13].sample)
    time1 = Time.new(0,1,1,[8,9].sample)
    time2 = Time.new(0,1,1,[10,11].sample)
    2.times { 
        Slot.create(date: date,s_time: time1,e_time:time2, discipline_id: Discipline.all.sample.id)
     }

 }

p "slots"

120.times { 
    a = Appointment.create(slot_id: Slot.all.sample.id, student_id: Student.all.sample.id)
    Attendance.create(appointment_id: a.id)
 }

 p "done"


