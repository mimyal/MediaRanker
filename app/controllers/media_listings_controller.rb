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
    creation_parameters = media_listing_params
    @media_listing = MediaListing.new(creation_parameters)
    @media_listing.ranking = 0
    @media_listing.type = params[:type]
    if @media_listing.save
      # SUCCESS
      redirect_to create_media_route
    else
      # DID NOT SAVE
      # Not sure these work as intended
      render :new
    end
  end

  def edit
    @media_listing = MediaListing.find(params[:id])
  end

  def update
    @media_listing = MediaListing.find(params[:id])
    @media_listing.ranking = params[:ranking]
    if @media_listing.update(upvote_param)
      # SUCCESS
      redirect_to media_listing_route(@media_listing)
    else
      # NO UPDATE
      # Not sure these work as intended
      render :edit
    end
  end

  # #########
  private

  def media_listing_params
    return params.require(:media_listing).permit(:type, :ranking, :name, :creator, :description)
  end

  def upvote_param
    return params.permit(:ranking)
  end
end
