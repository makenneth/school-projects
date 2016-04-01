class BandsController < ApplicationController
   before_action :redirect_unless_log_in!, except: [:index]

   def index
      @bands = Band.includes(:albums).all
      render :index
   end

   def new
      @band = Band.new
      render :new
   end

   def create
      @band = Band.new(band_params)
      if @band.save
         redirect_to band_url(@band)
      else
         render :new
      end
   end

   def show
      @band = Band.includes(:albums, :tracks).find(params[:id])
      render :show
   end

   def edit
      @band = Band.find(params[:id])
      render :edit
   end

   def update
      @band = Band.find(params[:id])
      if @band.update(band_params)
         redirect_to band_url(band)
      else
         render :edit
      end
   end

   def destroy
      @band = Band.find(params[:id])
      if @band.destroy
         redirect_to bands_url
      else
         redirect_to band_url(@band)
      end
   end

   private
   def band_params
      params.require(:band).permit(:name)
   end
end
