require './lib/database_connection'

describe DatabaseConnection do
  describe '#setup' do
    it "Should connect with the test db" do
      expect(PG).to receive(:connect).with('postgres://localhost/vending_machine_test')
      DatabaseConnection.setup('postgres://localhost/vending_machine_test')
    end
  end

  describe '#query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('postgres://localhost/vending_machine_test')
      expect(connection).to receive(:exec).with("SELECT * FROM snacks;")
      DatabaseConnection.query("SELECT * FROM snacks;")
    end
  end
end
