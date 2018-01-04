task :setup_data => :environment do 
	10.times do 
		Instructor.create(name: Faker::Name.first_name, email: Faker::Internet.free_email, bio: Faker::Lorem.paragraph, mobile: Faker::Number.number(10))
	end

	Course.create(name: "Web Development", description: Faker::Lorem.paragraph, instructor_id: Instructor.all.sample.id)
	Course.create(name: "Ruby on Rails", description: Faker::Lorem.paragraph, instructor_id: Instructor.all.sample.id)
	Course.create(name: "Javascript", description: Faker::Lorem.paragraph, instructor_id: Instructor.all.sample.id)
	Course.create(name: "Angular", description: Faker::Lorem.paragraph, instructor_id: Instructor.all.sample.id)
	Course.create(name: "Python", description: Faker::Lorem.paragraph, instructor_id: Instructor.all.sample.id)

	200.times do 
		student = Student.create(name: Faker::Name.first_name, email: Faker::Internet.free_email, mobile: Faker::Number.number(10), major: "BE CS")
		student.courses.push(Course.all.sample)
	end

end