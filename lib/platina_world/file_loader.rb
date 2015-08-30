require "yaml"
require "platina_world/errors/file_path_error"
require "platina_world/errors/invalid_extension_error"

module PlatinaWorld
  class FileLoader
    DEFAULT_FILE_PATH = "./platina_world.yml".freeze
    ACCEPTABLE_EXTENSIONS = %w(.yml .yaml).freeze

    def initialize(file_path)
      @file_path = file_path
    end

    def load
      case
      when !exist_file?
        PlatinaWorld::Logger.error(file_path_error) and abort
      when !valid_extension_type?
        PlatinaWorld::Logger.error(invalid_extion_error) and abort
      else
        file_load
      end
    end

    private

    def file_path_error
      PlatinaWorld::Errors::FilePathError.new(file_path)
    end

    def invalid_extion_error
      PlatinaWorld::Errors::InvalidExtensionError.new(ACCEPTABLE_EXTENSIONS)
    end

    def file_path
      @file_path ||= DEFAULT_FILE_PATH
    end

    def file_load
      YAML.load_file(file_path)
    end

    def exist_file?
      File.exist?(file_path)
    end

    def valid_extension_type?
      ACCEPTABLE_EXTENSIONS.include?(File.extname(file_path))
    end
  end
end
