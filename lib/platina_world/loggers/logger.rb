require "platina_world/loggers/base"

module PlatinaWorld
  module Loggers
    class Logger < Base
      private

      def formatter_class
        PlatinaWorld::Loggers::Formatter
      end
    end

    class Formatter
      def call(severity, time, program_name, message)
        case severity
        when "INFO"
          "    \e[32m#{message}\n\e[0m"
        when "ERROR"
          "    \e[31m#{message}\n\e[0m"
        end
      end
    end
  end
end
