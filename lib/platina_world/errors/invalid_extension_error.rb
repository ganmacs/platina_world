require "platina_world/errors/base"

module PlatinaWorld
  module Errors
    class InvalidExtensionError < Base
      def initialize(acceptable_extensions)
        @acceptable_extensions = acceptable_extensions
      end

      def to_s
        "Extension is invalid, please pass type of #{types}"
      end

      private

      def types
        @acceptable_extensions.join(" or ")
      end
    end
  end
end
