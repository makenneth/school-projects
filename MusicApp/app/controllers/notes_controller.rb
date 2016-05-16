class NotesController < ApplicationController
   before_action :ensure_author, only: [:destroy]

  def new
     @note = Note.new
     render :new
  end

  def create
     @note = Note.new(comment: params[:note][:comment])
     @note.user = current_user
     @note.track_id = params[:track_id]
     if @note.save
        redirect_to track_url(@note.track_id)
     else
        render :new
     end
  end

  def destroy
     @note = Note.find(params[:id])
     @note.destroy
     redirect_to track_url(@note.track_id)
  end
  #
  def update
     @note = Note.find(params[:id])
     @track = @note.track
     if @note.update(comment: params[:note][:comment])
        redirect_to track_url(@note.track)
     else
        render :edit
     end
  end
  #
  def edit
     @note = Note.find(params[:id])
     render :edit
  end

 def ensure_author
    user = Note.find(params[:id]).user
    return nil if user

    unless current_user == user
      render text: "Dude...", status: :forbidden
    end
 end

end
