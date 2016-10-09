require 'test_helper'

class PersonTest < ActiveSupport::TestCase 
       
 def valid_params
 	{ first_name: "John", last_name: "Doe", email: "john.doe@example.com",job: "Developer", bio: "Loren Ipsum Dolor", gender: "Male", birthdate: "01/10/1900",picture: 'https://tracker.moodle.org/secure/attachment/30912/f3.png'}
 end
 
 def test_exist_first_name
    params = valid_params.clone
    params.delete :first_name    
    person = Person.new params   
 end
end
