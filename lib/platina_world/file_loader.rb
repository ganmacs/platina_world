require "yaml"

module PlatinaWorld
  class FileLoader
    DEFAULT_FILE_PATH = "./platina_world.yml".freeze
    ACCEPT_EXT_NAMES = %w(.yml .yaml).freeze

    def initialize(file_path)
      @file_path = file_path
    end

    def load
      case
      when !exist_file?
        raise "#{file_path} is not found."
      when !valid_ext_name?
        raise "Ext name is invalid. plase pass .yml or .yaml file"
      else
        file_load
      end
    end

    private

    def file_path
      @file_path ||= DEFAULT_FILE_PATH
    end

    def file_load
      YAML.load_file(file_path)
    end

    def exist_file?
      File.exist?(file_path)
    end

    def valid_ext_name?
      ACCEPT_EXT_NAMES.include?(File.extname(file_path))
    end
  end
end
