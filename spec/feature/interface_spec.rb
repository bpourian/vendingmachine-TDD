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
    it "" do

    end
  end

  describe '#select_snack' do
    it "" do

    end
  end

  describe '#load_snacks_db' do
    it "" do

    end
  end

  describe '#snack_data' do
    it "" do

    end
  end
end
