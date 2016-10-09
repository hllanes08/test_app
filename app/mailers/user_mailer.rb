class UserMailer < ApplicationMailer
    default from: "test_app@example.com"
   
    def created_person(person, last_person)
	 mail(
	 to:person.email,
	 subject: 'People App - New person added') 
    end
end