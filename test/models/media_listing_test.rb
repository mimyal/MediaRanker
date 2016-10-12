require 'test_helper'

class MediaListingTest < ActiveSupport::TestCase
  test "Created media listings must have a name and a type" do
    puts "HEY TEST? #{media_listings}"
    puts ">>> DPR: #{movies}"
    puts ">>> DPR: #{albums}"
    listing_movie = media_listings(:valid_movie)
    puts "#{listing_movie} WHERE WHEREE ???"
    assert listing_movie.valid?
    # listing_book = media_listings(:valid_book)
    # assert listing_book.valid?
    # listing_album = media_listings(:valid_album)
    # assert listing_album.valid?
    #
    # incomplete_album = media_listings(:invalid_listing_type)
    # assert_not incomplete_album.valid?
    #
    # blank_listing_name = media_listings(:blank_listing_name)
    # assert_not blank_listing_name.valid?
    #
    # blank_listing_type = media_listings(:blank_listing_type)
    # assert_not blank_listing_type.valid?
  end

  test "Created media listings must have an approved media type (Movie/Book/Album)" do
    # listing =
  end
end
