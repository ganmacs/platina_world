require "platina_world/generators/base"
require "fileutils"

module PlatinaWorld
  module Generators
    class File < Base
      private

      def generate_directory(path)
        FileUtils.mkdir_p(path.name)
      end

      def generate_file_with_dir(path)
        FileUtils.mkdir_p(path.directory_name)
        generate_file(path)
      end

      def generate_file(path)
        FileUtils.touch(path.file_path)
        ::File.write(path.name, path.contents) if path.has_contents?
      end
    end
  end
end
