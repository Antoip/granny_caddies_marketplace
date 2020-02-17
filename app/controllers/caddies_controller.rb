class CaddiesController < ApplicationController
  def index
    @caddies = Caddie.all
  end

  def show
    @caddie = Caddie.find(params[:id])
  end

  def new
    @caddie = Caddie.new
  end

  def create
    @caddie = Caddie.new(caddie_params)
    if @caddie.save
      redirect_to caddy_path(@caddie)
    else
      render :new
    end
  end

  def edit
    @caddie = Caddie.find(params[:id])
  end

  def update
    @caddie = Caddie.find(params[:id])

    if @caddie.update(caddie_params)
      redirect_to caddy_path(@caddie)
    else
      render :edit
    end
  end

  private

  def caddie_params
    params.require(:caddie).permit(:name, :description, :availability, :condition, :wheels_number, :capacity)
  end

end