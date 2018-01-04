# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create(name: "admin")
Role.create(name: "receptionist")
Role.create(name: "instructor")
Role.create(name: "student")
Role.create(name: "guest")

User.create(email: "admin@gmail.com", password: "secret123", role_id: Role.find_by(name: "admin").id)

User.create(email: "1@gmail.com", password: "secret123", role_id: Role.find_by(name: "receptionist").id)

User.create(email: "2@gmail.com", password: "secret123", role_id: Role.find_by(name: "instructor").id)

User.create(email: "3@gmail.com", password: "secret123",
	role_id: Role.find_by(name: "student").id)