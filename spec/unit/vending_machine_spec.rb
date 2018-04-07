require './lib/vending_machine'

describe VendingMachine do

  subject(:vendingmachine)          { described_class.new }
  let(:mock_snacks)                 { [{ name: "Walkers Crisps", price: 0.50 }] }
  let(:mock_change)                 { [{ "1p": 0.01 }, { "2p": 0.02 }, { "5p": 0.05 }] }
  let(:mock_print)                  { "1 Walkers Crisps -- £0.50\n" }
  let(:mock_selection_response)     { "Selection: Walkers Crisps -- amount due: £0.50\n" }


  describe '#print_snacks' do
    it "Prints all available snacks in vending machine" do
      vendingmachine.load_snacks(mock_snacks, 'vending_machine_test')
      expect { vendingmachine.print_snacks }.to output(mock_print).to_stdout
    end
  end

  describe '#select_snack' do
    it "Should accept user selection" do
      vendingmachine.load_snacks(mock_snacks, 'vending_machine_test')
      expect { vendingmachine.select_snack(1) }.to output(mock_selection_response).to_stdout
    end
  end

  describe '#insert_money' do
    before do
      $stdin = StringIO.new("0.50")
    end

    it "Should prompt user to insert money" do
      allow(vendingmachine).to receive(:calculate_change)
      expect { vendingmachine.insert_money }.to output("Insert Money here:").to_stdout
    end
  end

  describe '#calculate_change' do
    before(:each) do
      vendingmachine.load_snacks(mock_snacks, 'vending_machine_test' )
    end

    it "Should return correct change" do
      expect(vendingmachine.calculate_change(2, 1)).to eq "Your change: 1.50"
    end

    it "Should prompt user for more money if insufficient amount paid" do
      expect(vendingmachine.calculate_change(0.4, 1)).to eq "Amount due: £0.10"
    end
  end

  describe '#load_snacks' do
    it "Should be able to load snacks to vending machine" do
      expect(vendingmachine.load_snacks(mock_snacks, 'vending_machine_test')).to eq([{ name: "Walkers Crisps", price: 0.50 }])
    end
  end

  describe '#load_change' do
    it "Should be able to load change to vending machine" do
      expect(vendingmachine.load_change(mock_change)).to eq([{ "1p": 0.01 }, { "2p": 0.02 }, { "5p": 0.05 }])
    end
  end
end
