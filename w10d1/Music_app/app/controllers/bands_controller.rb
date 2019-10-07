class BandsController < ApplicationController
  def new
    render :new
  end

  def create
    if logged_in?
      @band = Band.new(name: params[:band][:name])
      if @band.save
        redirect_to band_url(@band)
      else
        flash[:errors] = @band.errors.full_messages
        render :new
      end
    else
      redirect_to new_session_url
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit 
  end

  def update
    @band = Band.find(params[:id])
    @band.name = params[:band][:name]
    if @band.save
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def show
    if logged_in?
      @band = Band.find(params[:id])
      render :show
    else
      redirect_to new_session_url
    end
  end

  def index
    @bands = Band.all
    render :index
  end

  def destroy
    if logged_in?
      @band = Band.find(params[:id])
      @band.destroy
      redirect_to bands_url
    else
      redirect_to new_session_url
    end
  end
end