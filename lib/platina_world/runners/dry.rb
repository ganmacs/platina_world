require "platina_world/runners/base"

module PlatinaWorld
  module Runner
    class Dry < Base
      private

      def generate_directory(path)
        # noop
      end

      def generate_file_with_dir(path)
        # noop
      end

      def generate_file(path)
        # noop
      end
    end
  end
end
