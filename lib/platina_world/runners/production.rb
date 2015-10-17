require "platina_world/runners/base"
require 'fileutils'

module PlatinaWorld
  module Runner
    class Production < Base
      private

      def generate_directory(path)
        FileUtils.mkdir_p(path.to_s)
      end

      def generate_file_with_dir(path)
        FileUtils.mkdir_p(path.dirname)
        generate_file(path)
      end

      def generate_file(path)
        FileUtils.touch(path.to_s)
        ::File.write(path.to_s, path.contents) if path.has_contents?
      end
    end
  end
end
