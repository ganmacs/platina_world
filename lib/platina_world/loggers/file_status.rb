require "platina_world/loggers/base"

module PlatinaWorld
  module Loggers
    class FileStatus < Base
      def create(path)
        info(action: :create, path: path)
      end

      def skip(path)
        info(action: :skip, path: path)
      end

      private

      def formatter_class
        PlatinaWorld::Loggers::FileFormatter
      end
    end

    class FileFormatter
      def call(severity, time, program_name, message)
        file_format(message[:action]) % message
      end

      def file_format(action)
        case action
        when :create
          "      \e[32m%{action}\e[0m  %{path}\n"
        when :skip
          "      \e[34m%{action}  \e[0m  %{path}\n"
        when :failed
          "      \e[31m%{action}  \e[0m  %{path}\n"
        end
      end
    end
  end
end
