class CosonsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_coson, only: [:edit, :show]
  before_action :move_to_index, only: [:edit]

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

  def destroy
    coson = Coson.find(params[:id])
    coson.destroy
    redirect_to root_path
  end

  private

  def coson_params
    params.require(:coson).permit(:title, :info, :url, :image).merge(user_id: current_user.id)
  end

  def set_coson
    @coson = Coson.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @coson.user.id
      redirect_to action: :index
    end
  end

end