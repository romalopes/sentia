class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people or /people.json
  def index
    if params[:order]
      order_direction = params[:asc] == "ASC" ? "DESC" : "ASC"
      order = "#{params[:order]} #{order_direction}"
    else
      order = 'people.updated_at DESC'
    end

    if params[:search_param]
      search_param = params[:search_param]
      @people = Person.where("people.first_name like ? or people.last_name like ?  or people.species like ? or people.weapon like ? or people.vehicle like ?", "%#{search_param}%", "%#{search_param}%", "%#{search_param}%", "%#{search_param}%", "%#{search_param}%").paginate(page: params[:page], per_page: 10)
    else
      @people = Person.all.order(order).paginate(page: params[:page], per_page: 10)
    end
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to person_url(@person), notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to person_url(@person), notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import
    total_imported, total_found = Person.import_people
    respond_to do |format|
      format.html { redirect_to people_url, notice: "People imported.  Imported:#{total_imported} people.  Found #{total_found} people" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:name, :species, :gender, :weapon, :vehicle)
    end
end
