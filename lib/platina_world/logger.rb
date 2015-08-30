require "logger"

module PlatinaWorld
  class Logger
    class Formatter
      def call(severity, time, program_name, message)
        case severity
        when "INFO"
          "\e[32m#{message}\n\e[0m"
        when "ERROR"
          "\e[31m#{message}\n\e[0m"
        end
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

    class << self
      %w(info errro).each do |method_name|
        define_method(method_name) do |action, path, logging_device = $stdout|
          @logging_device = logging_device
          logger.info(
            action: action,
            path: path
          )
        end
      end

      def test_mode!
        logger.close
      end

      private

      attr_reader :logging_device

      def logger
        @logger ||= build_logger
      end

      def build_logger
        ::Logger.new(logging_device).tap do |logger|
          logger.formatter = PlatinaWorld::Logger::FileFormatter.new
        end
      end
    end
  end
end
