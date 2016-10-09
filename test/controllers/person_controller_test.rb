require 'test_helper'

class PersonControllerTest < ActionController::TestCase
   def setup 
      @person = Person.new(first_name: "Jonh", last_name: "Doe", email: "jonhdoe@mail.es", birthdate: "01/10/1990", job: "Developer")
   end
   
   test "get index" do
	@person.save
	get :index
	assert_response :success
        assert_select "body table tbody tr:first td:nth-child(2)", @person.email
  end

   test "post create" do
   	post :create, person: {first_name: "Jonh", last_name: "Doe", email: "jonhdoe@mail.es", birthdate: "01/10/1990", job: "Developer"}
	assert_redirected_to person_path(assigns(:person))
   end
    test "update person" do
	@person.save
   	patch :update,id: @person.id ,person: {first_name: "Juan", last_name: "Doe", email: "jonhdoe@mail.es", birthdate: "01/10/1990", job: "Developer"}
	assert_redirected_to person_path(assigns(:person))
   end

    test "show person" do
    	@person.save!
	get :show, id: @person.id
	assert_response :success
	assert_select "body div.container h2", "#{@person.first_name} #{@person.last_name}"

    end

end
