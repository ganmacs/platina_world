require "platina_world/generators/base"

module PlatinaWorld
  module Generator
    class Mock < Base
      private

      def generate_directory(path)
        PlatinaWorld::Logger.info("Create Directory: #{path.file_path}")
      end

      def generate_file(path)
        PlatinaWorld::Logger.info("Create File:      #{path.file_path}")
      end

      def generate_file_with_dir(path)
        PlatinaWorld::Logger.info("Create File:      #{path.file_path}")
      end
    end
  end
end
