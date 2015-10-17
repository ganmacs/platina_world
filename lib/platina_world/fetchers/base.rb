module PlatinaWorld
  module Fetcher
    class Base
      # @uri [PlatinaWorld::Path]
      def initialize(path)
        @path = path
      end

      def fetch
        if valid?
          fetch_contents
        else
          fail "invalid file path: #{@path}"
        end
      end

      private

      def fetch_contents
        raise NotImplementedError
      end
    end
  end
end
