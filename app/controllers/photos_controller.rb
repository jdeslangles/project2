class PhotosController < ApplicationController
 load_and_authorize_resource

# Photo wall methods
  def photo_wall
    @photos = Photo.all
    render :photo_wall
  end

  def like_wall
      @user = User.find(params[:user_id])
      @album = Album.find(params[:album_id])
      @photo = Photo.find(params[:id])
      @photo.liked_by current_user
      redirect_to :photo_wall
  end

  def unlike_wall
      @user = User.find(params[:user_id])
      @album = Album.find(params[:album_id])
      @photo = Photo.find(params[:id])
      @photo.disliked_by current_user
      redirect_to :photo_wall
  end


# Voting methods
  def like
    if params[:id]
      @photo = Photo.find(params[:id])
      @photo.liked_by current_user
      redirect_to user_album_photo_path(@photo.album.user, @photo.album, @photo)
    end
  end

  def unlike
    if params[:id]
      @photo = Photo.find(params[:id])
      @photo.disliked_by current_user
      redirect_to user_album_photo_path(@photo.album.user, @photo.album, @photo)
    end
  end

  def download
    @photo = Photo.find(params[:id])
    send_file ActionController::Base.helpers.asset_path(@photo.photo_picture.path), disposition: 'attachment'
  end


  # GET /photos
  # GET /photos.json
  def index
    @user = User.find(params[:user_id])
    @album = Album.find(params[:album_id])
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @user = User.find(params[:user_id])
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])
    @comment = Comment.new


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
     @album = Album.find(params[:album_id])
      @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1/edit
  def edit
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])

  end

  # POST /photos
  # POST /photos.json
  def create
    @album = Album.find(params[:album_id])
    @photo = @album.photos.build(params[:photo])


    respond_to do |format|
      if @photo.save
        format.html { redirect_to user_album_path(@album.user, @album), notice: 'Photo successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end


  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])


    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to user_album_photo_path(@photo.album.user, @photo.album, @photo), notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])

    @photo.destroy

    respond_to do |format|
      format.html { redirect_to user_album_path(@album.user, @album) }
      format.json { head :no_content }
    end
  end
end
