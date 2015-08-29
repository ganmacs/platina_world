# require "generators/file_generator"
# require "generators/directory_generator"

module PlatinaWorld
  class Generator
    def initialize(loaded_file)
      @loaded_file = loaded_file
    end

    def call
      pp @loaded_file
    end
  end
end
