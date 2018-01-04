class Instructor < ActiveRecord::Base
	has_many :courses
	
	validates_presence_of :name, :email, :bio, :mobile
	validates_uniqueness_of :name, :email, :mobile
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates_numericality_of :mobile
	validates_length_of :mobile, is: 10
end
