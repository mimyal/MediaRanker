class Libro
  attr_reader :id, :title, :creator_last_name, :creator_first_name, :isbn

  def initialize(uri_id, title, creator_last_name, creator_first_name, isbn)
    @id = uri_id
    @title = title
    @creator_last_name = creator_last_name
    @creator_first_name = creator_first_name
    @isbn = isbn
  end

  def Libro.search_result(isbn)
    return LibrisWrapper.get_book(isbn)
  end
end
