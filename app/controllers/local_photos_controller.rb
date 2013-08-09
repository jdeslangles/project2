class LocalPhotosController < ApplicationController

  def show
    @photo = Photo.find(params[:id])
    authorize! :show, @photo

    respond_to do |format|
      format.html do
        if @photo.photo_picture.file.respond_to?(:url)
          url = @photo.photo_picture.file.try(:url)
          data = open(url).read
          send_data data, :disposition => 'inline'
        else
          send_file @photo.photo_picture.file.path, :disposition => 'inline'
        end
      end
    end
  end
end