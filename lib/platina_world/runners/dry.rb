require "platina_world/runners/base"
require "platina_world/generators/mock"

module PlatinaWorld
  module Runners
    class Dry < Base
      private

      def generator_class
        PlatinaWorld::Generators::Mock
      end
    end
  end
end
