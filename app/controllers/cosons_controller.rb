class CosonsController < ApplicationController
  def index
    @cosons = Coson.all
  end

  def new
    @coson = Coson.new
  end

  def create
    @coson = Coson.create(coson_params)
    if @coson.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @coson = Coson.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def coson_params
    params.require(:coson).permit(:title, :info, :url, :image).merge(user_id: current_user.id)
  end
end