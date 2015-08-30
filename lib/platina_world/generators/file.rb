require "platina_world/generators/base"
require "fileutils"

module PlatinaWorld
  module Generators
    class File < Base
      private

      def generate_directory(path)
        FileUtils.mkdir_p(path.directory_name)
      end

      def generate_file(path)
        FileUtils.touch(path.file_name)
      end

      def generate_file_with_dir(path)
        FileUtils.mkdir_p(path.directory_name)
        FileUtils.touch("#{path.directory_name}/#{path.file_name}")
      end
    end
  end
end
