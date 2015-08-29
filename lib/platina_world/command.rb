require "optparse"
require "platina_world/runner"

module PlatinaWorld
  class Command
    def initialize(argv = ARGV)
      @argv = argv
    end

    def call
      runner.run
    end

    private

    def runner
      @runner ||= PlatinaWorld::Runner.new(options)
    end

    def options
      @options ||= option_parser.getopts(@argv)
    end

    def option_parser
      @optin_parser ||= OptionParser.new do |opt|
        opt.version = PlatinaWorld::VERSION
        opt.on("-p", "--path [file]", "Configuration file path") { |file_path| file_path }
      end
    end
  end
end
