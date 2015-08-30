require "platina_world/file_loader"
require "platina_world/file_generator"
require "platina_world/path_builder"

module PlatinaWorld
  class Runner
    def initialize(options)
      @options = options
    end

    def run
      file_generator.call
    end

    private

    def file_generator
      PlatinaWorld::FileGenerator.new(paths)
    end

    def paths
      @paths ||= PlatinaWorld::PathBuilder.new(loaded_data).build
    end

    def loaded_data
      @loaded_data ||= PlatinaWorld::FileLoader.new(file_path).load
    end

    def file_path
      @options["path"]
    end
  end
end
