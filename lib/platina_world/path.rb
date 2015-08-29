module PlatinaWorld
  class Path
    def initialize(file_path)
      @file_path = file_path
    end

    def file_name
      path[:file]
    end

    def directory_name
      path[:directory]
    end

    def directory?
      file_name == ""
    end

    def has_directory?
      directory_name != ""
    end

    private

    attr_reader :file_path

    # Return file name and dirctory name as Array
    # @params [String] file path (e.g "a/b/c")
    # @return [[String, String]] first is file path name and second is directory path name
    #
    # Examples.
    # file_and_dir_name("a/b/c") => ["a/b", "c"]
    # file_and_dir_name("a/b/c/") => ["a/b/c", ""]
    def path
      @path ||= begin
        path = file_path.split("/", -1)
        file_name = path.pop
        directory_name = path.join("/")

        {
          file: file_name,
          directory: directory_name
        }
      end
    end
  end
end
