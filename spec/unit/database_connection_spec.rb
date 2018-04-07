require './lib/database_connection'

describe DatabaseConnection do
  describe '#setup' do
    it "Should connect with the test db" do
      expect(PG).to receive(:connect).with({:dbname=>"vending_machine_test"})
      DatabaseConnection.connect('vending_machine_test')
    end
  end

  describe '#query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.connect('vending_machine_test')
      expect(connection).to receive(:exec).with("SELECT * FROM Snacks;")
      DatabaseConnection.query("SELECT * FROM Snacks;")
    end
  end
end
