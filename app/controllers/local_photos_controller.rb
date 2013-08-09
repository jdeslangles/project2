class LocalPhotosController < ApplicationController

  def show
    @photo = Photo.find(params[:id])
      authorize! :show, @photo

      respond_to do |format|
        format.html do
          send_file @photo.photo_picture.file.path, :disposition => "inline"

        end
    end
  end
end