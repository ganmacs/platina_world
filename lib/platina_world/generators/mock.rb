require "platina_world/generators/base"

module PlatinaWorld
  module Generator
    class Mock < Base
      private

      def generate_directory(path)
        p path.directory_name
      end

      def generate_file(path)
        p path.file_name
      end

      def generate_file_with_dir(path)
        p path.directory_name
        p "#{path.directory_name}/#{path.file_name}"
      end
    end
  end
end
