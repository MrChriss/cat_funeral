class FuneralsController < ApplicationController
  before_action :set_funeral, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_customer

  def index
    @funerals = Funeral
      .where('start_time > ?', params[:date])
      .where('end_time < ?', Date.parse(params[:date]).end_of_day)

    @weather = WeatherService.new(params[:date]).weather
  end

  def show
  end

  def new
    @funeral = Funeral.new
  end

  def edit
  end

  def create
    @funeral = Funeral.new(funeral_params)

    respond_to do |format|
      if @funeral.save
        format.html { redirect_to @funeral, notice: 'Funeral was successfully created.' }
        format.json { render :show, status: :created, location: @funeral }
      else
        format.html { render :new }
        format.json { render json: @funeral.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @funeral.update(funeral_params)
        format.html { redirect_to :back, notice: 'Funeral was successfully updated.' }
        format.json { render :show, status: :ok, location: @funeral }
      else
        format.html { render :edit }
        format.json { render json: @funeral.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @funeral.destroy
    redirect_to :back
  end


  def redirect_back
    redirect_to :back
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funeral
      @funeral = Funeral.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funeral_params
      params.require(:funeral).permit(:name, :start_time)
    end
end
