class SearchController < ApplicationController
  def index
    if params[:q]
      search = params[:q].to_s.downcase
      @photos = Photo.where('LOWER(name) like :search OR LOWER(description) like :search', search: "%#{search}%")
      @albums = Album.where('LOWER(name) like :search OR LOWER(description) like :search', search: "%#{search}%")
      @users = User.where('LOWER(username) like :search OR LOWER(first_name) like :search OR LOWER(last_name) like :search OR LOWER(biography) like :search OR LOWER(location) like :search', search: "%#{search}%")
    else
      @photos=[]
      @albums = []
      @users = []
    end
  end

  def search
    index
    render :index
  end

end
