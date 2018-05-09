require 'httparty'

class LibrisWrapper
  BASE_URL = "http://libris.kb.se/xsearch"
  FORMAT = "&format=json"
  # No keys needed

  attr_reader :data

  def self.get_book(isbn) #string
    url = BASE_URL + "?q=#{isbn}" + FORMAT
    @data = HTTParty.get(url).parsed_response # parsed?
    if @data['xsearch']['records'] == 0
      return nil
    else
      # check if @dataISBN is same numbers as arg isbn
      identifier = @data['xsearch']['list'][0]['identifier'] # this is the URL page for the book
      title = @data['xsearch']['list'][0]['title']
      creator = @data['xsearch']['list'][0]['creator']
      if creator.nil?
        author_last = nil
        author_first = nil
      else
        author_last = creator.split(', ')[0]
        author_first = creator.split(', ')[1]
      end
      return Libro.new(isbn, title, author_last, author_first, identifier)

    end

  end

end
