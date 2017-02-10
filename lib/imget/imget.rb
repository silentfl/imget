module Imget
  class << self
    def images_from(url)
      html = Fetcher.get(url)
      page = Page.new(html)

      page
        .images
        .map { |src| (URI.join(url) + src).to_s }
        .sort
        .uniq
    end
  end
end
