class DetailsController < ApplicationController
  #before_action :set_detail, only: [:show, :edit, :update, :destroy]

  def new
    #用get,所以可以傳schedule_id,place_id
    #找出spot
    @detail = Detail.new
    #@WishItem = params[:place_id]
    @spot = Spot.where(place_id: params[:place_id]).first
    #@spot = Spot.where(place_id:"ChIJqZwyeygCaDQRgqs_sMMtcvo").first
    #@spot = Spot.last
    #要有如果找不到的防呆
    @schedules = Schedule.find(params[:schedule_id])
    #test data
    #@event = Event.find(3)
    #@schedules = @event.schedules.last
    #render :new
    #回傳的view不要含有layout
    render :layout => false
  end

 def create
    #1.找出該筆spot_id - 用place去找
    #begin
    @schedules = Schedule.find(params[:detail][:schedule_id])

    #要有如果找不到的防呆!!!!!!
    @spot = Spot.find(params[:detail][:spot_id])
    #rescue ActiveRecord::RecordNotFound
    #    @msgResult =  "error"


    params[:detail].parse_time_select! :start_t
    @detail = @spot.details.build(detail_params)
    #@detail.start_t = start_t

    @detail.schedule = @schedules


    if @detail.save
      @msgResult = "detail was scuccessfully created"
     else
      @msgResult = "detail was failed to create"
     end

    #render :json => { :msgResult => @msgResult }
  end

  def show

  end

  private



  def set_detail
    @detail = Detail.find(params[:id])
  end

  def detail_params
    params.require(:detail).permit(:hr, :category_id, :content, :traffic,:start_t,:spot_id,:schedule_id)

  end



end
