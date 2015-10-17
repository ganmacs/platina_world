describe PlatinaWorld::TemplateManager do
  let(:manager) { described_class.new }

  before do
    ENV["HOME"] = "~/home"
  end

  describe "#root_path" do
    subject do
      manager.root_path.to_s
    end

    it { is_expected.to eq "~/home/.platina_world" }
  end

  describe "#expand" do
    subject do
      manager.expand("ruby")
    end

    it { is_expected.to eq "~/home/.platina_world/ruby.yml" }
  end

  describe "#show_items" do
    subject do
      manager.show_items
    end

    before do
      allow_any_instance_of(PlatinaWorld::TemplateManager).to receive(:all_files) do
        [
          "~/home/.platina_world/ruby.yml",
          "~/home/.platina_world/scala.yml"
        ]
      end
    end

    it "retuns" do
      expect { subject }.to output("ruby\nscala\n").to_stdout
    end
  end
end
