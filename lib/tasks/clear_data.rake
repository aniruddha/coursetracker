task :clear_data => :environment do 
	Instructor.delete_all
	Publication.delete_all 
	Course.delete_all 
	Student.delete_all 
	Registration.delete_all
	#
	#
end