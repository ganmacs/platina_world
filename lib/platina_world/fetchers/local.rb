require "net/http"
require "platina_world/fetchers/base.rb"

module PlatinaWorld
  module Fetcher
    class Local < Base
      private

      def valid?
        exist_file?
      end

      def fetch
        File.read(path)
      end

      def path
        expand(@uri)
      end

      def expand(uri)
        uri.to_s.gsub("$HOME", ENV["HOME"])
      end

      def exist_file?
        File.exist?(path)
      end
    end
  end
end
