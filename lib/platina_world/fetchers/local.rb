require "platina_world/fetchers/base"

module PlatinaWorld
  module Fetcher
    class Local < Base
      private

      def valid?
        exist_resouce?
      end

      def fetch_contents
        File.read(expanded_uri)
      end

      def expanded_uri
        @expanded_uri ||= @uri.to_s.gsub("$HOME", ENV["HOME"])
      end

      def exist_resouce?
        ::File.exist?(expanded_uri)
      end
    end
  end
end
