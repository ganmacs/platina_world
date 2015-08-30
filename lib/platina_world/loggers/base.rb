require "logger"

module PlatinaWorld
  module Loggers
    class Base < ::Logger
      def initialize(*)
        super
        self.formatter = formatter_class.new
      end

      private

      def formatter_class
        raise NotImplementedError
      end
    end
  end
end
