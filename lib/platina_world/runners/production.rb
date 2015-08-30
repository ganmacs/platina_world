require "platina_world/runners/base"
require "platina_world/generators/file"

module PlatinaWorld
  module Runner
    class Production < Base
      private

      def generator_class
        PlatinaWorld::Generator::File
      end
    end
  end
end
