class PersonController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /person
  # GET /person.json
  def index
    @people = Person.order(:first_name, :last_name).all
  end

  # GET /person/1
  # GET /person/1.json
  def show
  end

  # GET /person/new
  def new
    @person = Person.new
    @action = 'create'
  end

  # GET /person/1/edit
  def edit
    @action = 'update'
  end

  # POST /person
  # POST /person.json
  def create
    @person = Person.new(person_params) 
    respond_to do |format|
      if @person.save
	SenderJob.perform_later(@person)
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
	@action = 'create'
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person/1
  # PATCH/PUT /person/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
	@action = 'update'
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person/1
  # DELETE /person/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to person_index_path, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:first_name, :last_name, :email, :job, :bio, :gender, :birthdate, :picture)
    end
end
