describe PlatinaWorld::Path do
  let(:path) { described_class.new(file_path) }

  describe "#file_name" do
    subject { path.file_name }

    context "when file_path is a/b/c" do
      let(:file_path) { "a/b/c" }

      it { is_expected.to eq "c" }
    end

    context "when file_path is a/b/" do
      let(:file_path) { "a/b/" }

      it { is_expected.to eq "" }
    end

    context "when file_path is a/b/" do
      let(:file_path) { "a" }

      it { is_expected.to eq "a" }
    end
  end

  describe "#directory_name" do
    subject { path.directory_name }

    context "when file_path is a/b/c" do
      let(:file_path) { "a/b/c" }

      it { is_expected.to eq "a/b" }
    end

    context "when file_path is a/b/" do
      let(:file_path) { "a/b/" }

      it { is_expected.to eq "a/b" }
    end

    context "when file_path is a/b/" do
      let(:file_path) { "a" }

      it { is_expected.to eq "" }
    end
  end

  describe "#directory?" do
    subject { path.directory? }

    context "when file_path is a/b/c" do
      let(:file_path) { "a/b/c" }

      it { is_expected.to be_falsey }
    end

    context "when file_path is a/b/" do
      let(:file_path) { "a/b/" }

      it { is_expected.to be_truthy }
    end

    context "when file_path is a/b/" do
      let(:file_path) { "a" }

      it { is_expected.to be_falsey }
    end
  end
end
