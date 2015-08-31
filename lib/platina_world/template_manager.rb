require "platina_world/path"

module PlatinaWorld
  class TemplateManager
    TEMPLATE_DIRCTORY = "#{ENV['HOME']}/.platina_world".freeze
    TEPLATE_FILE_PATTERN = "#{TEMPLATE_DIRCTORY}/*_world.{yml,yaml}".freeze

    def all
      @all ||= all_files.each do |file|
        file.match(%r!#{root_path}/(?<attr>.*)\_world!) do |m|
          puts m[:attr]
        end
      end
    end

    def root_path
      TEMPLATE_DIRCTORY
    end

    private

    def all_files
      @all_files ||= Dir.glob(TEPLATE_FILE_PATTERN)
    end
  end
end
