require 'test_helper'

class LibrisWrapperTest < ActiveSupport::TestCase

  test "get_book returns a valid Libro instance" do
    VCR.use_cassette("book-response") do
      isbn = '91-1-927571-4'
      actual_book = LibrisWrapper.get_book(isbn)
      assert_equal Libro, actual_book.class
    end
  end

  test "get_book returns the correct book title (libro instance)" do
    VCR.use_cassette("book-response") do
      isbn = '91-1-927571-4'
      actual_book = LibrisWrapper.get_book(isbn)
      expected_book = Libro.new('http://libris.kb.se/bib/7156259', 'Sent i november', 'Jansson', 'Tove', '91-1-927571-4')

      assert_equal actual_book.title, expected_book.title

      # This doesn't work because minitest is not good at comparing objects
      # assert_equal(actual_book, expected_book)
    end
  end

  test "get_book should return nil for unexpected isbn requests" do
    VCR.use_cassette("response") do
      isbn = 'some-unknown-isbn'
      unexpected_response = LibrisWrapper.get_book(isbn)

      assert_nil unexpected_response

    end
  end

end
