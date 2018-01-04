class Course < ActiveRecord::Base

	# has_many :join_table
	# has_many :associated_table, through: :join_table

	has_many :registrations
	has_many :students, through: :registrations

	belongs_to :instructor 

	validates_presence_of :name, :description, :instructor_id
	validates_uniqueness_of :name

end
