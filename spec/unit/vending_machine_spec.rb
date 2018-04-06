require './lib/vending_machine'

describe VendingMachine do

  subject(:vendingmachine)          { described_class.new(mock_snacks) }
  let(:mock_snacks)                 { [{name: "Walkers Crisps", price: 0.50}] }
  let(:mock_print)                  { "1 Walkers Crisps -- £0.50\n" }
  let(:mock_selection_response)     { "Selection: Walkers Crisps -- amount due: £0.50\n" }

  describe '#show_snacks' do
    it "Shows all available snacks in vending machine" do
      expect { vendingmachine.show_snacks }.to output(mock_print).to_stdout
    end
  end

  describe '#select_snack' do
    it "Should allow me to make a selection" do
      expect { vendingmachine.select_snack(1) }.to output(mock_selection_response).to_stdout
    end
  end

  describe '#insert_money' do
    before do
    $stdin = StringIO.new("0.50")
    end
    
    it "Should prompt user to insert money" do
      expect { vendingmachine.insert_money }.to output("Insert Money here:").to_stdout
    end
  end
end
