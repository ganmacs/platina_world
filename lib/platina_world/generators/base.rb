module PlatinaWorld
  module Generator
    class Base
      def initialize(paths)
        @paths = paths
      end

      def call
        @paths.each do |path|
          case
          when path.directory?
            generate_directory(path)
          when path.has_directory?
            generate_file_with_dir(path)
          else
            generate_file(path)
          end

          PlatinaWorld::Logger.info("create", path.file_path)
        end
      end

      private

      def generate_directory(path)
        raise NotImplementedError
      end

      def generate_file(path)
        raise NotImplementedError
      end

      def generate_file_with_dir(path)
        raise NotImplementedError
      end
    end
  end
end
