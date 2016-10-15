def edit_route(listing)
  if listing.type == "Movie"
    return edit_movie_path(listing.id)
  elsif listing.type == "Book"
    return edit_book_path(listing.id)
  elsif listing.type == "Album"
    return edit_album_path(listing.id)
  else
    return Error("Unknown media")
  end
end

# This is not the neatest way to do this. But it works until @media_listings is empty
def new_route(listings)
  if listings.first.type == "Movie"
    return new_movie_path
  elsif listings.first.type == "Book"
    return new_book_path
  elsif listings.first.type == "Album"
    return new_album_path
  else
    return Error("Unknown media")
  end
end

def media_listing_route(listing)
  if listing.type == "Movie"
    return movie_path(listing.id)
  elsif listing.type == "Book"
    return book_path(listing.id)
  elsif listing.type == "Album"
    return album_path(listing.id)
  else
    return Error("Unknown media")
  end
end

def media_listings_route(listings)
  if listings.first.type == "Movie"
    return movies_path
  elsif listings.first.type == "Book"
    return books_path
  elsif listings.first.type == "Album"
    return albums_path
  else
    return Error("Unknown media")
  end
end
