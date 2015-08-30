module PlatinaWorld
  class Path
    attr_reader :file_path

    def initialize(file_path)
      @file_path = file_path
    end

    # @return [String] file name
    def file_name
      path[:file]
    end

    # @return [String] directory path
    def directory_name
      path[:directory]
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

    def path
      @path ||= file_and_directory_name
    end

    # Return file name and dirctory name as Array
    # @return [{String => String}] file name and directory name as Hash
    #
    # Examples.
    # file_path = "a/b/c"
    # file_and_directory_name => { directory: "a/b", file: "c"}
    #
    # file_path = "a/b/c/"
    # file_and_directory_name("a/b/c/") => ["a/b/c", ""]
    def file_and_directory_name
      path = file_path.split("/", -1)
      file_name = path.pop
      directory_name = path.join("/")

      { file: file_name, directory: directory_name }
    end
  end
end
