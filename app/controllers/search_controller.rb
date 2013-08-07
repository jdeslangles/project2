class SearchController < ApplicationController
  def index
    if params[:q]
      @photos = Photo.where('name like :name', name: "%#{params[:q]}%")
      @album = Album.where('name like :name', name: "%#{params[:q]}%")
      @users = User.where('username like :username', username: "%#{params[:q]}%")

    end
  end

  def search
    index
    render :index
  end

end
