module PlatinaWorld
  module Fetcher
    class Base
      def initialize(uri)
        @uri = uri.dup
      end

      def run
        raise "invalid file path: #{@uri}" unless valid?
        fetch
      end

      private

      def fetch
        raise NotImplementedError
      end
    end
  end
end
