require './lib/vending_machine'

describe VendingMachine do



  describe '#show_snacks' do
    subject(:vendingmachine)          { described_class.new(mock_snacks) }
    let(:mock_snacks)                 { [{name: "Walkers Crisps", price: 0.50}] }
    let(:mock_print)                  { "1 Walkers Crisps -- £0.50\n" }


    it "Shows all available snacks in vending machine" do
      p mock_print
      expect { vendingmachine.show_snacks }.to output(mock_print).to_stdout
    end
  end
end
