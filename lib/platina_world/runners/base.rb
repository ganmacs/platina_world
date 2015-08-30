require "platina_world/path_builder"

module PlatinaWorld
  module Runner
    class Base
      def initialize(loaded_file)
        @loaded_file = loaded_file
      end

      def run
        file_generator.call
      end

      private

      def generator_class
        raise NotImplementedError
      end

      def file_generator
        generator_class.new(paths)
      end

      def paths
        @paths ||= PlatinaWorld::PathBuilder.new(@loaded_file).build
      end
    end
  end
end
