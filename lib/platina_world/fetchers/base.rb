module PlatinaWorld
  module Fetcher
    class Base
      # @uri [URI::HTTP, URI::HTTPS, URI:Generic]
      def initialize(uri)
        @uri = uri
      end

      def fetch
        if valid?
          fetch_contents
        else
          fail "invalid file path: #{@uri}"
        end
      end

      private

      def valid?
        raise NotImplementedError
      end

      def fetch_contents
        raise NotImplementedError
      end
    end
  end
end
