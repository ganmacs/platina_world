require "net/http"
require "platina_world/fetchers/base.rb"

module PlatinaWorld
  module Fetcher
    class Net < Base
      private

      def valid?
        true
      end

      def fetch
        ::Net::HTTP.get(@uri)
      end
    end
  end
end
