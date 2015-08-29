require "platina_world/path_builder"
require "fileutils"

module PlatinaWorld
  class FileGenerator
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
      end
    end

    private

    def generate_directory(path)
      FileUtils.mkdir(path)
    end

    def generate_file(path)
      FileUtils.touch(path.file_name)
    end

    def generate_file_with_dir(path)
      FileUtils.mkdir_p(path.directory_name)
      FileUtils.touch("#{path.directory_name}/#{path.file_name}")
    end
  end
end
