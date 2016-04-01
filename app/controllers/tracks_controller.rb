class TracksController < ApplicationController
   before_action :redirect_unless_log_in!

   def edit
      @track = Track.find(params[:id])
      render :edit
   end

   def update
      @track = Track.find(params[:id])
      if @track.update
         redirect_to album_url(params[:track][:album_id])
      else
         render :edit
      end
   end

   def show
      @track = Track.includes(:notes).find(params[:id])
      @note = Note.new
      render :show
   end

   def new
      @track = Track.new
      render :new
   end

   def create
      @track = Track.new(track_params)
      if @track.save
         redirect_to album_url(params[:track][:album_id])
      else
         render :new
      end
   end

   private
   def track_params
      params.require(:track).permit(:title, :album_id, :lyrics, :bonus)
   end
end
