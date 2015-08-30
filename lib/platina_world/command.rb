require "optparse"
require "platina_world/runner"
require "platina_world/file_loader"

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
      @runner ||= PlatinaWorld::Runner.new(loaded_file, dry_run: dry_run?)
    end

    def loaded_file
      @loaded_file ||= PlatinaWorld::FileLoader.new(file_path).load
    end

    def file_path
      options["path"]
    end

    def dry_run?
      options["dry-run"]
    end

    def options
      @options ||= option_parser.getopts(@argv)
    end

    def option_parser
      @optin_parser ||= OptionParser.new do |opt|
        opt.version = PlatinaWorld::VERSION
        opt.on("-p", "--path [file]", "Configuration file path")
      end
    end
  end
end
