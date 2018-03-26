class DetailsController < ApplicationController
  #before_action :set_detail, only: [:show, :edit, :update, :destroy]

  def new
    #用get,所以可以傳schedule_id,place_id
    #找出spot
    puts "test"
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
  end

 def create
    #1.找出該筆spot_id - 用place去找
    @event = Event.find(3)
    @schedules = @event.schedules.last

    #要有如果找不到的防呆
    @spot = Spot.find(params[:detail][:spot_id])
    @detail = @spot.details.build(detail_params)
    @detail.schedule = @schedules

    if @detail.save
      flash #會留到下一個request
      flash[:notice] = "detail was scuccessfully created"
      redirect_to root_path
     else
      flash.now #只存在現在這個request
      flash.now[:alert] = "detail was failed to create"
      render :new
     end
  end


  private
  def set_detail
    @detail = Detail.find(params[:id])
  end

  def detail_params
    params.require(:detail).permit(:hr, :category_id, :content, :traffic, :start_t,:spot_id,:schedule_id)

  end



end
