require 'test_helper'

class PersonControllerTest < ActionController::TestCase
   def setup 
      @person = Person.new(first_name: "Jonh", last_name: "Doe", email: "jonhdoe@mail.es", birthdate: "01/10/1990", job: "Developer")
      @person.save
   end
   
   test "get index" do

	get :index
	assert_response :success
        assert_select "body table tbody tr:first td:nth-child(2)", @person.email
   end
   test "get new" do
   	get :new
	assert_response :success
   end 

   test "post create" do
   	post :create, person: {first_name: "Jonh", last_name: "Tito", email: "jontitor@mail.es", birthdate: "01/10/1990", job: "Developer"}
	assert_redirected_to person_path(assigns(:person))
   end
    test "update person" do
   	patch :update,id: @person.id ,person: {first_name: "Juan", last_name: "Doe", email: "jonhdoe@mail.es", birthdate: "01/10/1990", job: "Developer"}
	assert_redirected_to person_path(assigns(:person))
   end

    test "show person" do 
	get :show, id: @person.id
	assert_response :success
	assert_select "body div.container h2", "#{@person.first_name} #{@person.last_name}"

    end

    test "delete person" do
	delete :destroy , id: @person.id
	assert_redirected_to person_index_path
    end

end
