describe PlatinaWorld::Generators::File do
  let(:file_generator) { described_class.new(paths) }

  describe "#call" do
    let(:paths) do
      [PlatinaWorld::Path.new(file_path)]
    end

    context "when path is 'a/b/c'" do
      let(:file_path) { "a/b/c" }

      it "call FileUtils.mkdir with 'a/b' once and FileUtils.touch with 'a/b/c' once"do
        expect(FileUtils).to receive(:mkdir_p)
        expect(FileUtils).to receive(:touch).with("a/b/c").once
        file_generator.call
      end
    end

    context "when path is 'a/b/'" do
      let(:file_path) { "a/b/" }

      it "call FileUtils.mkdir with 'a/b' once"do
        expect(FileUtils).to receive(:mkdir_p).with("a/b").once
        file_generator.call
      end
    end

    context "when path is 'a" do
      let(:file_path) { "a" }

      it "call FileUtils.touch with 'a'"do
        expect(FileUtils).to receive(:touch).with("a").once
        file_generator.call
      end
    end
  end
end
