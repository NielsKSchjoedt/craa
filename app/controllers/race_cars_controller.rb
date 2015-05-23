class RaceCarsController < ApplicationController
  before_action :set_race_car, only: [:show, :edit, :update, :destroy]

  # GET /race_cars
  # GET /race_cars.json
  def index
    @race_cars = RaceCar.all
  end

  # GET /race_cars/1
  # GET /race_cars/1.json
  def show
  end

  # GET /race_cars/new
  def new
    @race_car = RaceCar.new
  end

  # GET /race_cars/1/edit
  def edit
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
      params.require(:race_car).permit(:start_no, :class_type, :make, :model, :year, :ccm, :hp, :description)
    end
end
