module Imget
  class Page
    def initialize(html)
      @page = ::Nokogiri::HTML.parse(html)
    end

    def images
      @page
        .xpath('//img/@src')
        .map(&:to_s)
    end
  end
end
