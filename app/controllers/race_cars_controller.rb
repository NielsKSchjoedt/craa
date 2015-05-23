class RaceCarsController < ApplicationController
  before_action :set_race_car, only: [:show, :edit, :update, :destroy, :upvote]
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  # GET /race_cars
  # GET /race_cars.json
  def index
    race_cars_scope = RaceCar.includes(:drivers)
    race_cars_scope = race_cars_scope.where(class_type: params[:class_type]) if params[:class_type].present?
    race_cars_scope = race_cars_scope.where(start_no: params[:start_no].to_i) if params[:start_no].present?
    smart_listing_create(:race_cars, race_cars_scope, partial: "race_cars/listing", default_sort: {votes: "desc"})
  end

  # GET /race_cars/1
  # GET /race_cars/1.json
  def show
    @your_vote = RaceCar.find_by_id(cookies[:voted_for])
  end

  # GET /race_cars/new
  def new
    @race_car = RaceCar.new
    @race_car.drivers.build
  end

  # GET /race_cars/1/edit
  def edit
  end

  def upvote
    RaceCar.transaction do
      RaceCar.decrement_counter(:votes, cookies[:voted_for]) if cookies[:voted_for] 
      @race_car.increment!(:votes)
      cookies.permanent[:voted_for] = @race_car.id
    end
    redirect_to :back, notice: "Tak for din stemme. Du har stemt nu på start nr. #{@race_car.start_no} som din favorit!"
  end

  # POST /race_cars
  # POST /race_cars.json
  def create
    @race_car = RaceCar.new(race_car_params)

    respond_to do |format|
      if @race_car.save
        format.html { redirect_to @race_car, notice: 'Race car was successfully created.' }
        format.json { render :show, status: :created, location: @race_car }
      else
        format.html { render :new }
        format.json { render json: @race_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /race_cars/1
  # PATCH/PUT /race_cars/1.json
  def update
    respond_to do |format|
      if @race_car.update(race_car_params)
        format.html { redirect_to @race_car, notice: 'Race car was successfully updated.' }
        format.json { render :show, status: :ok, location: @race_car }
      else
        format.html { render :edit }
        format.json { render json: @race_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /race_cars/1
  # DELETE /race_cars/1.json
  def destroy
    @race_car.destroy
    respond_to do |format|
      format.html { redirect_to race_cars_url, notice: 'Race car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_race_car
      @race_car = RaceCar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def race_car_params
      params.require(:race_car).permit(:start_no, :class_type, :make, :model, :year, :ccm, :hp, :acceleration, :description, :picture, drivers_attributes: [:full_name, :country, :profile_pictrue])
    end
end
