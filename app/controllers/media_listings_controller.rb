class MediaListingsController < ApplicationController
  def index
    @media_listings = MediaListing.where(type: params[:type])
  end

  # This will currently show any type of media as long as the id is correct (so the movie with id =1 will also show on /books/1)
  def show
    @listing = MediaListing.find(params[:id])
  end

  def new
    @media_listing = MediaListing.new
    @media_listing.type = params[:type] # rather enter here than later?
  end

  # The actual destroy works
  def destroy
    index # is this allowed?
    MediaListing.find(params[:id]).destroy
    redirect_to media_listings_route(@media_listings)
  end

  def create
    @media_listing = MediaListing.new(media_listing_params)
    raise
    if @media_listing.save
      # SUCCESS
      # redirect_to # WHERE?
    else
      # DID NOT SAVED
      render :new
    end
  end

  def edit
    @media_listing = MediaListing.find(params[:id])
    # raise
  end

  def update
    @media_listing = MediaListing.find(params[:id])
    raise
    if @media_listing.update(update_params)
      # SUCCESS
      # raise # The method must be in the wrong place or something
      redirect_to media_listing_route(@media_listing)
      # redirect_to root_path
    else
      # NO UPDATE
      render :edit
    end
  end

  # #########
  private

  def media_listing_params
    puts ">>> NNN <<< #{params.require(:media_listing).permit(:type, :ranking, :name, :creator, :description)}"
    puts ">>> XXX <<< #{params.permit(:type, :ranking).require(:media_listing).permit(:type, :ranking, :name, :creator, :description)}"
    puts "<<< VVVV <<< #{params.permit(:ranking, :type, :name, :creator, :description)}"
    return params.require(:media_listing).permit(:type, :ranking, :name, :creator, :description)
    # return params.permit(:ranking, :type, :name, :creator, :description)
    # params.permit(:type, :ranking, :name, :creator, :description)
  end
end
