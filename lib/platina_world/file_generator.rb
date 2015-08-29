require "platina_world/path_builder"

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
          generate_file(path)
        else
          generate_file(path)
        end
      end
    end

    private

    def generate_directory(path)
      Dir.mkdir(path)
    end

    def generate_file(path)
      FileUtils.touch(path.file_name)
    end
  end
end
