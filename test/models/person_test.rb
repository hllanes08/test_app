require 'test_helper'

class PersonTest < ActiveSupport::TestCase 
       
 def setup
     @person = Person.new
 end 
 test "first_name should exist" do
    @person.valid?
    assert_includes(@person.errors[:first_name], "can't be blank")
 end

 test "first name must be minimim 75 characters"  do 
    @person.first_name = "Loren ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"
    @person.valid?
    assert_includes(@person.errors[:first_name],"is too long (maximum is 75 characters)")
 end

 test "last name should exist" do
    @person.valid?
    assert_includes(@person.errors[:last_name], "can't be blank")
 end
 test "last name must be minimim 75 characters"  do 
    @person.last_name = "Loren ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"
    @person.valid?
    assert_includes(@person.errors[:last_name],"is too long (maximum is 75 characters)")
 end
 test "email should exist"  do
    @person.valid?
    assert_includes(@person.errors[:email],"can't be blank")
 end
 test "email should be well formmated"  do
    @person.email = "lorenipsumdolor"
    @person.valid?
    assert_includes(@person.errors[:email],"is invalid")
 end
 
 test "email should be unique"  do
    Person.create(first_name: "Johm", last_name: "Doe",email: "john.doe@mail.com", job: "developer", birthdate: "01/01/2000")
    @person.email = "john.doe@mail.com"
    @person.valid?
    assert_includes(@person.errors[:email],"has already been taken")
 end

 test "email must be minimim 75 characters"  do 
    @person.email = "Loren ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat Loren ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"
    @person.valid?
    assert_includes(@person.errors[:email],"is too long (maximum is 254 characters)")
 end


end
