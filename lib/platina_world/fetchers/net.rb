require "net/http"
require "platina_world/fetchers/base"

module PlatinaWorld
  module Fetcher
    class Net < Base
      private

      def valid?
        true
      end

      def fetch_contents
        ::Net::HTTP.get(@uri)
      end
    end
  end
end
