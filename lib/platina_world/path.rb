require "platina_world/content_fetcher"

module PlatinaWorld
  class Path
    attr_reader :file_path

    def initialize(file_path, contents_path = nil)
      @file_path = file_path
      @contents_path = contents_path
    end

    def contents
      return @contents if instance_variable_defined?(:@contents)
      @contents =
        if has_contents_path?
          ContentFetcher.new(@contents_path).fetch
        else
          nil
        end
    end

    def has_contents?
      !!contents
    end

    def name
      @name ||=
        case
        when directory?
          directory_name
        when has_directory?
          "#{directory_name}/#{file_name}"
        else
          file_name
        end
    end

    # @return [String] file name
    def file_name
      path_info[:file]
    end

    # @return [String] directory path
    def directory_name
      path_info[:directory]
    end

    # @return [True, False] path is directory or not
    def directory?
      file_name == ""
    end

    # @return [True, False] path has directory path or not
    def has_directory?
      directory_name != ""
    end

    private

    def has_contents_path?
      !!@contents_path
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
      path = file_path.split("/", -1)
      file_name = path.pop
      directory_name = path.join("/")

      { file: file_name, directory: directory_name }
    end
  end
end
