class Place < ActiveRecord::Base
	belongs_to :user, :dependent => :destroy
	has_many :comments, :dependent => :destroy
	has_many :photos
	
	geocoded_by :address
	after_validation :geocode

	validates :name, :presence => true
    validates_length_of :name, minimum: 3, too_short: 'Please enter at least 3 characters'
	validates :address, :presence => true
	validates :description, :presence => true


end
