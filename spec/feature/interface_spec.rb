require './interface'

describe Interface do

  subject(:interface)                   { described_class.new(vending_machine) }
  let(:vending_machine)                 { :vending_machine }

  describe '#show_commands' do
    it "Print available commands" do
      allow(interface).to receive(:show_commands).and_return("Test text")
      expect(interface.show_commands).to eq("Test text")
    end
  end

  describe '#print_snacks' do
    it "Method call should respond" do
      allow(interface).to receive(:print_snacks).and_return("Method called")
      expect(interface.print_snacks).to eq ("Method called")
    end
  end

  describe '#select_snack' do
    it "Method call should respond" do
      allow(interface).to receive(:select_snack).with(1).and_return("Method called")
      expect(interface.select_snack(1)).to eq ("Method called")
    end
  end

  describe '#load_snacks_db' do
    it "Method call should respond" do
      allow(interface).to receive(:load_snacks_db).with(1).and_return("Method called")
      expect(interface.load_snacks_db(1)).to eq ("Method called")
    end
  end

  describe '#snack_data' do
    it "Method call should respond" do
      allow(interface).to receive(:snack_data).and_return("Test text")
      expect(interface.snack_data).to eq ("Test text")
    end
  end
end
