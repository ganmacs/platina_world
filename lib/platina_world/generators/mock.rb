require "platina_world/generators/base"

module PlatinaWorld
  module Generator
    class Mock < Base
      private

      def generate_directory(path)
        # noop
      end

      def generate_file(path)
        # noop
      end

      def generate_file_with_dir(path)
        # noop
      end
    end
  end
end
