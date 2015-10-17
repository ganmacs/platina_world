require "platina_world/path"

module PlatinaWorld
  class PathBuilder
    def initialize(loaded_file)
      @loaded_file = loaded_file
    end

    def build
      generate_paths(@loaded_file).flat_map do |file_path|
        PlatinaWorld::Path.new(file_path)
      end
    end

    private

    def generate_paths(paths)
      case paths
      when Array
        paths.flat_map { |p| generate_paths(p) }
      when Hash
        dir = paths.keys.first
        files_in_dir = paths.values.first

        if files_in_dir
          v = generate_paths(files_in_dir)
          v.map { |e| "#{dir}/#{e}" }
        else
          "#{dir}/"
        end
      else
        [paths]
      end
    end
  end
end
