require "platina_world/fetchers/base"

module PlatinaWorld
  module Fetcher
    class Local < Base
      private

      def valid?
        @path.exist?
      end

      def fetch_contents
        File.read(@path.to_s)
      end

      def expand(uri)
        uri.to_s.gsub("$HOME", ENV["HOME"])
      end
    end
  end
end
