module PlatinaWorld
  module Generators
    class Base
      def initialize(paths)
        @paths = paths
      end

      def call
        @paths.each do |path|
          file_path = path.file_path

          if file_exist?(file_path)
            PlatinaWorld::FileStatus.skip(file_path)
          else
            generate(path)
            PlatinaWorld::FileStatus.create(file_path)
          end
        end
      end

      private

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

      def file_exist?(file_path)
        ::File.exist?(file_path)
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
