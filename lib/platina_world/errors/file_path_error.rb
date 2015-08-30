require "platina_world/errors/base"

module PlatinaWorld
  module Errors
    class FilePathError < Base
      def initialize(file_path)
        @file_path = file_path
      end

      def to_s
        "File does not exist: `#{@file_path}`"
      end
    end
  end
end
