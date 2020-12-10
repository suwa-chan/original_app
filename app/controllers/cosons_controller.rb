class CosonsController < ApplicationController
  def index
  end

  def new
    @cosons = Coson.new
  end

  def create
    @coson = Coson.create(coson_params)
    if @coson.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def coson_params
    params.require(:coson).permit(:title, :info, :url, :image).merge(user_id: current_user.id)
  end
end
