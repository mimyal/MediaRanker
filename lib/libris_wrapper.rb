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
      identifier = @data['xsearch']['list'][0]['identifier']
      title = @data['xsearch']['list'][0]['title']
      author_last = @data['xsearch']['list'][0]['creator'].split(', ')[0]
      author_first = @data['xsearch']['list'][0]['creator'].split(', ')[1]

      return Libro.new(identifier, title, author_last, author_first, isbn)
    end

  end

end
