describe PlatinaWorld::PathBuilder do
  let(:path_builder) { described_class.new(file_path) }

  describe "#build" do
    subject { path_builder.build.map(&:to_s) }

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
                           "platina/the/",
                           "platina/world1.rb",
                           "platina/world2.rb"]
      end
    end
  end
end
