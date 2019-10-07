class AlbumsController < ApplicationController

    def new 
      render :new
    end 

    def create
      if logged_in?
        # fail
        # album_params
        # @album_params[:studio] == 'studio' ? @album_params[:studio] = true : @album_params[:studio] = false
        title = album_params[:title]
        year = album_params[:year]
        band_id = album_params[:band_id]
        if album_params[:studio] == "live"
            studio = false 
        else  
            studio = true 
        end 
        
        @album = Album.new(title: title, year: year, band_id: band_id, studio: studio)
        
        # if @album.studio == "studio"
        #   @album.studio = true
        # else
        #   @album.studio = false
        # end
        
        if @album.save
          redirect_to album_url(@album.id)
        else
          flash[:errors] = @album.errors.full_messages
          render :new
        end
      else
        redirect_to new_session_url
      end
    end 

    def show 
        @album = Album.find(params[:id])
        @band = Band.find(@album.band_id)
        # @band = Band.find_by(id: params[:band_id])
        render :show
    end 

    def edit 
        render :edit
    end 

    def update 

    end 

    def destroy

    end 

    private 
    def album_params 
      @album_params = params.require(:album).permit(:title, :year, :studio, :band_id)
    end 

end 