class CaddiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_caddie, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].nil?
      @caddies = Caddie.where(availability: true)
      @caddies_geo = Caddie.geocoded
      @markers = @caddies_geo.map do |caddie|
        {
          lat: caddie.latitude,
          lng: caddie.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { caddie: caddie })
        }
      end
      caddies_path(anchor: 'home-card-list')
    else
      results = PgSearch.multisearch(params[:query])
      if results.empty?
        @caddies = Caddie.where(availability: true)
        @caddies_geo = Caddie.geocoded
        @markers = @caddies_geo.map do |caddie|
        {
          lat: caddie.latitude,
          lng: caddie.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { caddie: caddie })
        }
        end
      else
        caddies_result = results.map do |result|
          result.searchable
        end
      @caddies = caddies_result.select do |caddie|
        caddie.price <= params[:price].to_i
        end


        @markers = @caddies.map do |caddie|
        {
          lat: caddie.latitude,
          lng: caddie.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { caddie: caddie })
        }
        end
      end
    end
  end


  def show
    @review = Review.new
    @message = Message.new
    @user = Caddie.find(params[:id]).user
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

  def edit
  end

  def update
    if @caddie.update(caddie_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def update_availability
    @caddie = Caddie.find(params[:id])
    if @caddie.availability == true
      @caddie.availability = false
    else
      @caddie.availability = true
    end
    @caddie.update({availability: @caddie.availability})
    redirect_to dashboard_path
  end

  def destroy
    @caddie.delete
    redirect_to caddies_path
  end

  private

  def set_caddie
    @caddie = Caddie.find(params[:id])
  end

  def caddie_params
    params.require(:caddie).permit(:name, :description, :availability, :condition, :wheels_number, :capacity, :price, :photo, :address)
  end

end
