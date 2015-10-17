require "platina_world/content_fetcher"

module PlatinaWorld
  class Path
    attr_reader :file_path

    # file_path [String]
    def initialize(file_path)
      @file_path, @contents_path = extract_path(file_path)
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

    def inspect
      @name ||=
        case
        when directory?
          dirname
        when has_directory?
          "#{dirname}/#{filename}"
        else
          filename
        end
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
      ::File.exist?(file_path)
    end

    private


    def extract_path(path)
      if path.include?("@")
        path.split("@")
      else
        [path, nil]
      end
    end

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
