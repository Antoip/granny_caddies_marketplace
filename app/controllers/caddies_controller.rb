class CaddiesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @caddies = Caddie.all
    @caddies_geo = Caddie.geocoded
    @markers = @caddies_geo.map do |caddie|
      {
        lat: caddie.latitude,
        lng: caddie.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { caddie: caddie })
      }
    end
  end

  def show
    @caddie = Caddie.find(params[:id])
    @review = Review.new
  end

  def new
    @caddie = Caddie.new
  end

  def create
    @caddie = Caddie.new(caddie_params)
    @caddie.user = current_user
    if @caddie.save
      redirect_to caddy_path(@caddie)
    else
      render :new
    end
  end

def caddie_params
  params.require(:caddie).permit(:title, :body, :photo)
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
    params.require(:caddie).permit(:name, :description, :availability, :condition, :wheels_number, :capacity, :price, :photo)
  end

end
