require "platina_world/file_loader"
require "platina_world/generator"

module PlatinaWorld
  class Runner
    def initialize(options)
      @options = options
    end

    def run
      generator.call
    end

    private

    def generator
      PlatinaWorld::Generator.new(loader.load)
    end

    def loader
      @loader ||= PlatinaWorld::FileLoader.new(file_path)
    end

    def file_path
      @options["file"]
    end
  end
end
