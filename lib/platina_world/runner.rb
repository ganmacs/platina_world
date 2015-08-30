require "platina_world/file_generator"
require "platina_world/path_builder"

module PlatinaWorld
  class Runner
    def initialize(loaded_file, dry_run: dry_run)
      @loaded_file = loaded_file
      @dry_run = dry_run
    end

    def run(dry_run: dry_run)
      file_generator.call
    end

    private

    def dry_file_generator
      PlatinaWorld::FileGenerator.new(paths)
    end

    def file_generator
      generator_class.new(paths)
    end

    def generator_class
      if @dry_run
        PlatinaWorld::FileGenerator.new(paths)
      else
        PlatinaWorld::FileGenerator.new(paths)
      end
    end

    def paths
      @paths ||= PlatinaWorld::PathBuilder.new(@loaded_file).build
    end
  end
end
