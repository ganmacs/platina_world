require "platina_world/fetcher_builder"
require "platina_world/fetchable"

module PlatinaWorld
  class Path
    include Fetchable

    # file_path [String]
    def initialize(file_path)
      @file_path, @contents_path = split_path(file_path)
    end

    def to_s
      @file_path
    end

    # @return [String] file name
    def filename
      path_info[:file]
    end

    # @return [String] directory path
    def dirname
      path_info[:directory]
    end

    # @return [True, False] path is directory or not
    def directory?
      filename == ""
    end

    # @return [True, False] path has directory path or not
    def has_directory?
      dirname != ""
    end

    def exist?
      ::File.exist?(@file_path)
    end

    private

    # override
    def contents_path
      @contents_path
    end

    def split_path(path)
      if path.include?("@")
        path.split("@")
      else
        [path, nil]
      end
    end

    def path_info
      @path_info ||= file_and_directory_name
    end

    # Return file name and dirctory name as Array
    # @return [{String => String}] file name and directory name as Hash
    #
    # Examples.
    # file_path = "a/b/c"
    # file_and_directory_name(file_path) # => { directory: "a/b", file: "c"}
    #
    # file_path = "a/b/c/"
    # file_and_directory_name(file_path) # => { directory: "a/b/c", file: ""}
    def file_and_directory_name
      path = @file_path.split("/", -1)
      file_name = path.pop
      directory_name = path.join("/")

      { file: file_name, directory: directory_name }
    end
  end
end
