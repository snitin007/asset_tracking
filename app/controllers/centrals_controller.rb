class CentralsController < ApplicationController
  before_action :set_central, only: [:show, :edit, :update, :destroy]

  # GET /centrals
  # GET /centrals.json
  def index
    @centrals = Central.all
  end

  # GET /centrals/1
  # GET /centrals/1.json
  def show
    @sensor_count = sensors_in_room_count
    @sensor = sensors_in_room
  end

  # GET /centrals/new
  def new
    @central = Central.new
  end

  # GET /centrals/1/edit
  def edit
  end

  # POST /centrals
  # POST /centrals.json
  def create
    @central = Central.new(central_params)
    puts "idhar #{params}"
    respond_to do |format|
      if @central.save
        format.html { redirect_to @central, notice: 'Central was successfully created.' }
        format.json { json_response(@central) }
      else
        format.html { render :new }
        format.json { render json: @central.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /centrals/1
  # PATCH/PUT /centrals/1.json
  def update
    respond_to do |format|
      if @central.update(central_params)
        format.html { redirect_to @central, notice: 'Central was successfully updated.' }
        format.json { render :show, status: :ok, location: @central }
      else
        format.html { render :edit }
        format.json { render json: @central.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /centrals/1
  # DELETE /centrals/1.json
  def destroy
    @central.destroy
    respond_to do |format|
      format.html { redirect_to centrals_url, notice: 'Central was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_central
      @central = Central.find(params[:id])
    end

    def sensors_in_room_count
      @central = Central.find(params[:id])
      @central.beacons[0,10].pluck(:sensor_id).uniq
    end

    def sensors_in_room
      @beacons = Central.find(params[:id]).beacons
      @sensors = Array.new
      sensors_in_room_count.each do |id|
        record = @beacons.where(sensor_id: id).last
        @sensors.push(record) if record.updated_at > 2.minutes.ago
      end
      @sensors
      # @uniq_ids = @central.beacons.select(:sensor_id).uniq
      # @uniq_ids.map do |id| 
      #   Beacon.where("updated_at < ?", 2.minutes.ago).each do |beacon|

      #   end
      # end
      # @central.beacons.where("updated_at < ?", 2.minutes.ago).select(:sensor_id, :orientation, :distance).select{|x, y, z|}
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def central_params
      if !params[:central]
        {
          room_id: params["room_id"],
          room_name: params["room_name"]
        }
      else
        {
          room_id: params[:central]["room_id"],
          room_name: params[:central]["room_name"]
        }
      end
    end
end
