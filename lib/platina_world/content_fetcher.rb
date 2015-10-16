require "uri"
require "platina_world/fetchers/local"
require "platina_world/fetchers/net"

module PlatinaWorld
  class ContentFetcher
    def initialize(path)
      @path = URI.parse(path)
    end

    def fetch
      fetcher.run
    end

    private

    def fetcher
      @fetcher ||= fetcher_class.new(@path)
    end

    def fetcher_class
      case @path
      when URI::HTTP, URI::HTTPS
        ::PlatinaWorld::Fetcher::Net
      when URI::Generic
        ::PlatinaWorld::Fetcher::Local
      else
        raise "Unknow URI TYPE:#{@path.class}"
      end
    end
  end
end
