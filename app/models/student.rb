class Student < ActiveRecord::Base

	# has_many :join_table
	# has_many :associated_table, through: :join_table

	has_many :registrations
	has_many :courses, through: :registrations


	validates_presence_of :name, :email, :major, :mobile
	validates_uniqueness_of :name, :email, :mobile
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates_numericality_of :mobile
	validates_length_of :mobile, is: 10
end
