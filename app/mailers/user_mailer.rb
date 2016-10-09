class UserMailer < ApplicationMailer
    default from: "test_app@example.com"
   
    def created_person(person, last_person)
	 @person = person
	 @last_person = last_person
	 mail(
	 to: person.email,
	 subject: 'People App - New person added') 
    end

    def deleted_person(to, drop_person)
    	@to = to
	@drop_person = drop_person
        mail(
	to: to.email,
	subject: "People App - New person deleted")
    end
end
