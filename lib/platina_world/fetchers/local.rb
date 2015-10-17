require "platina_world/fetchers/base"

module PlatinaWorld
  module Fetcher
    class Local < Base
      CONVERT_TABLE = {
        "$HOME" => ENV["HOME"],
        "$ROOT" => "#{ENV['HOME']}/.platina_world"
      }

      private

      def valid?
        exist_resouce?
      end

      def fetch_contents
        File.read(expanded_uri)
      end

      def expanded_uri
        @expanded_uri ||= @uri.to_s.gsub(%r(\$[^/]+), CONVERT_TABLE)
      end

      def exist_resouce?
        ::File.exist?(expanded_uri)
      end
    end
  end
end
