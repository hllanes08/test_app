##
# Public: Person class for manage any action over people table
# firts_name :string  max 75 characters
# last_name  :string  max 75 characters
# email	     :string   valdate presence, uniq and valid email
# job	     :string	accept null
# bio	     :text  	description
# gender     :integer	enum for two types
# birthdate  :date	date of birth
# picture    :string	url of picture
#
class Person < ActiveRecord::Base
   self.table_name = "people"
   enum gender: [:Male , :Female ]
   validates_length_of :first_name, maximum: 75
   validates_length_of :last_name, maximum: 75
   validates_length_of :job, maximum: 75
   validates_length_of :email, maximum: 254

   validates_presence_of :first_name
   validates_presence_of :last_name  
   validates_presence_of :email
   validates_presence_of :birthdate
   validates_uniqueness_of :email
   validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
   validate :before_today

   def before_today
       if !self.birthdate.nil? && self.birthdate.future?
	    errors.add(:birthdate, "can't be after today")
       end
   end
end
