module Imget
  module Fetcher
    class << self
      def get(url)
        response = HTTParty.get(url)
        raise Imget::NetworkError if response.code != 200

        response.body
      rescue HTTParty::Error, Timeout::Error, Errno::EINVAL, Errno::ECONNRESET,
        Errno::ECONNREFUSED, EOFError, Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError 
        raise Imget::NetworkError
      end
    end
  end
end
