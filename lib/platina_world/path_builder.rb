require "platina_world/path"

module PlatinaWorld
  class PathBuilder
    def initialize(loaded_data)
      @loaded_data = loaded_data
    end

    def build
      generate_paths(@loaded_data).map do |file_path|
        PlatinaWorld::Path.new(file_path)
      end
    end

    private

    def generate_paths(paths)
      paths.flat_map do |path|
        case path
        when Array
          generate_paths(path)
        when Hash
          dir = path.keys.first
          files_in_dir = path.values.first

          if files_in_dir
            v = generate_paths(files_in_dir)
            v.map { |e| "#{dir}/#{e}" }
          else
            "#{dir}/"
          end
        else
          path
        end
      end
    end
  end
end
