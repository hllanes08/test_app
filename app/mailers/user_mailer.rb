class UserMailer < ApplicationMailer
    default from: "test_app@example.com"
   
    def created_person(person, last_person)
	 @person = person
	 @last_person = last_person
	 p mail(
	 to: person.email,
	 subject: 'People App - New person added') 
    end
end
