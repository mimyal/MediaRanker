module MediaListingsHelper

  def created_per_type(listing)
    if listing.type == "Movie"
      return "Directed"
    elsif listing.type == "Book"
      return "Written"
    elsif listing.type == "Album"
      return "Performed"
    else
      return "(Unknown media type) Created"
    end
  end

  def edit_route(listing)
    if listing.type == "Movie"
      return edit_movie_path
    elsif listing.type == "Book"
      return edit_book_path
    elsif listing.type == "Album"
      return edit_album_path
    else
      return Error
    end
  end

  def media_listing_route(listing)
    if listing.type == "Movie"
      return movie_path
    elsif listing.type == "Book"
      return book_path
    elsif listing.type == "Album"
      return album_path
    else
      return Error
    end
  end
end
