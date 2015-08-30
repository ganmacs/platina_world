require "optparse"
require "platina_world/runners/dry"
require "platina_world/runners/production"
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
      runner_class.new(loaded_file)
    end

    def runner_class
      if dry_run?
        PlatinaWorld::Runners::Dry
      else
        PlatinaWorld::Runners::Production
      end
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
        opt.on("-n", "--dry-run", "run in dry-run mode")
      end
    end
  end
end
