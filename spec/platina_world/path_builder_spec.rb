describe PlatinaWorld::PathBuilder do
  let(:path_builder) { described_class.new(file_path) }

  describe "#build" do
    subject { extract_file_path(path_builder.build) }

    context "when data is String" do
      let(:file_path) do
        "platina.rb"
      end

      it { is_expected.to eq [file_path] }
    end

    context "when data is Array" do
      let(:file_path) do
        [
          "platina1.rb",
          "platina2.rb"
        ]
      end

      it { is_expected.to eq file_path }
    end

    context "when data is Hash" do
      let(:file_path) do
        {
          "platina" => [
            "world1.rb",
            "world2.rb"
          ]
        }
      end

      it { is_expected.to eq %w(platina/world1.rb platina/world2.rb) }
    end

    context "when data is Complex Hash" do
      let(:file_path) do
        {
          "platina" => [
            { "worlds" => ["star1.rb", "star2.rb"] },
            { "the" => nil },
            "world1.rb",
            "world2.rb"
          ]
        }
      end

      it do
        is_expected.to eq ["platina/worlds/star1.rb",
                           "platina/worlds/star2.rb",
                           "platina/the",
                           "platina/world1.rb",
                           "platina/world2.rb"]
      end
    end
  end

  def extract_file_path(paths)
    paths.map do |path|
      case
      when path.directory?
        "#{path.directory_name}"
      when path.has_directory?
        "#{path.directory_name}/#{path.file_name}"
      else
        "#{path.file_name}"
      end
    end
  end
end
