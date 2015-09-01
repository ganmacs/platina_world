require "optparse"
require "platina_world/runners/dry"
require "platina_world/runners/production"
require "platina_world/file_loader"
require "platina_world/template_manager"

module PlatinaWorld
  class Command
    def initialize(argv = ARGV)
      @argv = argv
    end

    def call
      case
      when list?
        template_manager.all
      when setup?
        template_manager.setup
      else
        runner.run
      end
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

    def template_manager
      @tempalte_manager ||= TemplateManager.new
    end

    def loaded_file
      PlatinaWorld::FileLoader.new(file_path).load
    end

    def file_path
      if template_path
        template_manager.file(template_path)
      else
        options["path"]
      end
    end

    def template_path
      options["template"]
    end

    def setup?
      options["setup"]
    end

    def list?
      options["list"]
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
        opt.on("-t", "--template [file]", "template from #{template_manager.root_path}/`file`_world.yml")
        opt.on("-l", "--list", "show tempalte lists")
        opt.on("-s", "--setup", "create tempalte directory as #{template_manager.root_path}")
      end
    end
  end
end
