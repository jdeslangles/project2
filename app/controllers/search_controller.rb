class SearchController < ApplicationController
  def index
    @q = Photo.search(params[:q])
    if params[:q]
      @photos = @q.result(distinct: :true)
      if @q.result.empty?
        flash[:error] = "No matches for #{params[:q][:name_cont]}."
      else
        flash[:error] = nil
      end
    else
      @photos=[]
    end
  end

  def search
    index
    render :index
  end

end
