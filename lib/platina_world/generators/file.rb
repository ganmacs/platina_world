require "platina_world/generators/base"
require "fileutils"

module PlatinaWorld
  module Generator
    class File < Base
      private

      def generate_directory(path)
        PlatinaWorld::Logger.info("Create Directory: #{path.file_path}")
        FileUtils.mkdir_p(path.directory_name)
      end

      def generate_file(path)
        PlatinaWorld::Logger.info("Create File:      #{path.file_path}")
        FileUtils.touch(path.file_name)
      end

      def generate_file_with_dir(path)
        PlatinaWorld::Logger.info("Create File:      #{path.file_path}")
        FileUtils.mkdir_p(path.directory_name)
        FileUtils.touch("#{path.directory_name}/#{path.file_name}")
      end
    end
  end
end
