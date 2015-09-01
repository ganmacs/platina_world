require "platina_world/path"

module PlatinaWorld
  class TemplateManager
    attr_reader :root_path, :template_file_pattern

    def initialize
      @root_path = "#{ENV['HOME']}/.platina_world".freeze
      @template_file_pattern = "#{root_path}/*_world.{yml,yaml}".freeze
    end

    def all
      @all ||= all_files.each do |file|
        file.match(%r!#{root_path}/(?<attr>.*)\_world!) do |m|
          puts m[:attr]
        end
      end
    end

    def setup
      if exist?
        PlatinaWorld::FileStatus.skip(root_path)
      else
        Dir.mkdir(root_path)
        PlatinaWorld::FileStatus.create(root_path)
      end
    end

    def file(template)
      "#{root_path}/#{template}_world.yml"
    end

    def exist?
      ::File.exist?(root_path)
    end

    private

    def all_files
      @all_files ||= Dir.glob(template_file_pattern)
    end
  end
end
