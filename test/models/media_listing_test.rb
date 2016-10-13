require 'test_helper'

class MediaListingTest < ActiveSupport::TestCase
  test "Created media listings must have a name and a type" do
    puts ">>> DPR: #{media_listings}"
    # puts ">>> DPR: #{movies.count}"
    # puts ">>> DPR: #{albums.count}"
    # puts ">>> DPR: #{books.count}"
    puts ">>> DPR: #{MediaListing.count}"
    puts ">>> DPR: #{MediaListing.first.inspect}"
    listing_movie = media_listings(:valid_movie)
    assert listing_movie.valid?
    listing_book = media_listings(:valid_book)
    assert listing_book.valid?
    listing_album = media_listings(:valid_album)
    assert listing_album.valid?

    incomplete_album = media_listings(:invalid_listing_type)
    assert_not incomplete_album.valid?

    blank_listing_name = media_listings(:blank_listing_name)
    assert_not blank_listing_name.valid?

    blank_listing_type = media_listings(:blank_listing_type)
    assert_not blank_listing_type.valid?
  end

  test "Created media listings must have an approved media type (Movie/Book/Album)" do
    # listing =
  end
end
