require "platina_world/path"

module PlatinaWorld
  class TemplateManager
    attr_reader :template_file_pattern

    def initialize
      @template_file_pattern = "#{root_path}/*.{yml,yaml}".freeze
    end

    def show_items
      @all ||= all_files.each do |file|
        file.match(%r!#{root_path}/(?<attr>.*)\.(yml|yaml)!) do |m|
          puts m[:attr]
        end
      end
    end

    def root_path
      @root_path ||= Path.new("#{ENV['HOME']}/.platina_world".freeze)
    end

    def setup
      path = root_path.to_s
      if root_path.exist?
        PlatinaWorld::FileStatus.skip(path)
      else
        Dir.mkdir(path)
        PlatinaWorld::FileStatus.create(path)
      end
    end

    def expand(template)
      "#{root_path}/#{template}.yml"
    end

    private

    def all_files
      @all_files ||= Dir.glob(template_file_pattern)
    end
  end
end
