require "platina_world/fetchers/local"
require "platina_world/fetchers/net"

module PlatinaWorld
  class FetcherBuilder
    def initialize(uri)
      @uri = URI.parse(uri)
    end

    def build
      fetcher_class.new(@uri)
    end

    private

    def fetcher_class
      case @uri
      when URI::HTTP, URI::HTTPS
        ::PlatinaWorld::Fetcher::Net
      when URI::Generic
        ::PlatinaWorld::Fetcher::Local
      else
        raise "Unknow URI type: #{@uri.class}(#{@uri})"
      end
    end
  end
end
