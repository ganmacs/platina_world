require "platina_world/loggers/base"

module PlatinaWorld
  module Loggers
    class FileStatus < Base
      private

      def formatter_class
        PlatinaWorld::Loggers::FileFormatter
      end
    end

    class FileFormatter
      def call(severity, time, program_name, message)
        file_format(severity) % message
      end

      def file_format(severity)
        case severity
        when "INFO"
          "      \e[32m%{action}\e[0m  %{path}\n"
        when "ERROR"
          "      \e[31m%{action}\e[0m  %{path}\n"
        end
      end
    end
  end
end
