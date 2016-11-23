require 'test_helper'

class LibroTest < ActiveSupport::TestCase

  test "Libro.search_result(isbn) should return a single instance of libro(book)" do
    VCR.use_cassette("response") do
      isbn = '91-1-927571-4'
      actual_book = Libro.search_result(isbn)
      assert_equal Libro, actual_book.class
    end
  end

end
