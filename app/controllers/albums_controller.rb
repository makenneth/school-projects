class AlbumsController < ApplicationController
   before_action :redirect_unless_log_in!

   def new
      @album = Album.new
      render :new
   end

   def create
      @album = Album.new(album_params)
      @album.band = Band.find_by(name: params[:album][:band_name])
      if @album.save
         redirect_to album_url(@album)
      else
         render :new
      end
   end

   def show
      @album = Album.includes(:tracks).find(params[:id])
      render :show
   end

   def edit
      @album = Album.find(params[:id])
      render :edit
   end

   def update
      @album = Album.find(params[:id])
      if @album.update(params[album_params])
         redirect_to album_url(@album)
      else
         render :edit
      end
   end

   def destroy
      @album = Album.find(params[:id])
      @album.destroy
      redirect_to band_url(@album.band)
   end

   private
   def album_params
      params.require(:album).permit(:title, :band_name)
   end
end
