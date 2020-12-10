class CosonsController < ApplicationController
  before_action :set_coson, only: [:edit, :show]

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
  end

  def edit
  end

  def update
    coson = Coson.find(params[:id])
    if coson.update(coson_params)
      redirect_to coson_path
    else
      render :edit
    end
  end

  private

  def coson_params
    params.require(:coson).permit(:title, :info, :url, :image).merge(user_id: current_user.id)
  end

  def set_coson
    @coson = Coson.find(params[:id])
  end
end