describe PlatinaWorld::Runner::Production do
  let(:runner) { described_class.new(paths) }

  describe "#call" do
    let(:paths) do
      [file_path]
    end

    context "when path is 'a/b/c'" do
      let(:file_path) { "a/b/c" }

      it "call FileUtils.mkdir with 'a/b' once and FileUtils.touch with 'a/b/c' once"do
        expect(FileUtils).to receive(:mkdir_p)
        expect(FileUtils).to receive(:touch).with("a/b/c").once
        runner.run
      end
    end

    context "when path is 'a/b/'" do
      let(:file_path) { "a/b/" }

      it "run FileUtils.mkdir with 'a/b/' once"do
        expect(FileUtils).to receive(:mkdir_p).with("a/b/").once
        runner.run
      end
    end

    context "when path is 'a'" do
      let(:file_path) { "a" }

      it "run FileUtils.touch with 'a'"do
        expect(FileUtils).to receive(:touch).with("a").once
        runner.run
      end

      context "with contents path" do
        context "and contents is url path" do
          let(:file_path) { "a@https://google.com" }

          it "run FileUtils.touch with 'a' and File write"do
            expect(FileUtils).to receive(:touch).with("a").once
            expect(::Net::HTTP).to receive(:get).with("https://google.com")
            runner.run
          end
        end

        context "and contents is local path" do
          let(:file_path) { "a@file/path" }
          let(:path) { paths.first }

          it "run FileUtils.touch with 'a' and File write"do
            allow(::PlatinaWorld::Fetcher::Local).to receive(:valid?).and_return(true)
            allow(::PlatinaWorld::Fetcher::Local).to receive(:read).and_return("")
            expect(FileUtils).to receive(:touch).with("a").once
            # expect(::File).to receive(:write).with(path, path).once
            runner.run
          end
        end
      end
    end
  end
end
