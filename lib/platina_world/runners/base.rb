require "platina_world/path_builder"

module PlatinaWorld
  module Runner
    class Base
      def initialize(loaded_file)
        @loaded_file = loaded_file
      end

      def run
        paths.each do |path|
          file_path = path.to_s

          if path.exist?
            PlatinaWorld::FileStatus.skip(file_path)
          else
            generate(path)
            PlatinaWorld::FileStatus.create(file_path)
          end
        end
      end

      private

      def paths
        @paths ||= PlatinaWorld::PathBuilder.new(@loaded_file).build
      end

      def generate(path)
        case
        when path.directory?
          generate_directory(path)
        when path.has_directory?
          generate_file_with_dir(path)
        else
          generate_file(path)
        end
      end

      def generate_directory(path)
        raise NotImplementedError
      end

      def generate_file_with_dir(path)
        raise NotImplementedError
      end

      def generate_file(path)
        raise NotImplementedError
      end
    end
  end
end
