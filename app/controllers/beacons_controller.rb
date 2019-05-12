class BeaconsController < ApplicationController
  before_action :set_beacon, only: [:show, :edit, :update, :destroy]

  # GET /beacons
  # GET /beacons.json
  def index
    @beacons = Beacon.all
  end

  # GET /beacons/1
  # GET /beacons/1.json
  def show
  end

  # GET /beacons/new
  def new
    @beacon = Beacon.new(central: Central.find(params[:central_id]))
  end

  # GET /beacons/1/edit
  def edit
  end

  # POST /beacons
  # POST /beacons.json
  def create
    @beacon = Beacon.new(beacon_params)

    respond_to do |format|
      if @beacon.save
        format.html { render :show }
        format.json { json_response(@beacon) }
      else
        format.html { render :new }
        format.json { render json: @beacon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beacons/1
  # PATCH/PUT /beacons/1.json
  def update
    respond_to do |format|
      if @beacon.update(beacon_params)
        format.html { redirect_to @beacon, notice: 'Beacon was successfully updated.' }
        format.json { render :show, status: :ok, location: @beacon }
      else
        format.html { render :edit }
        format.json { render json: @beacon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beacons/1
  # DELETE /beacons/1.json
  def destroy
    @beacon.destroy
    respond_to do |format|
      format.html { redirect_to central_beacons_url, notice: 'Beacon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beacon
      @beacon = Beacon.find(params[:id])
    end

    def rssi_to_distance(dist)
      ratio = dist*1.0/(-60)
      res = 0
      if (ratio < 1.0) 
        res = ratio ** 10
      else 
        res = (0.89976)*(ratio ** (7.7095)) + 0.111;    
      end
      res * 1000
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beacon_params
      if !params[:beacon]
      {
        central_id: params[:central_id], 
        orientation: params[:orientation],
        distance: rssi_to_distance(params[:distance].to_f).round(3), 
        sensor_id: params[:sensor_id]
      }
      else
      {
        central_id: params[:beacon]["central_id"], 
        orientation: params[:beacon]["orientation"],
        distance: rssi_to_distance(params[:beacon]["distance"].to_f).round(3), 
        sensor_id: params[:beacon]["sensor_id"]
      }
    end
    end
end
