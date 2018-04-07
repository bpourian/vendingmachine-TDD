require './lib/database_connection'

describe DatabaseConnection do
  describe 'Connection setup' do
    it "Should connect with the test db" do
      expect(PG).to receive(:connect).with('postgres://localhost/vending_machine_test')
      DatabaseConnection.setup('postgres://localhost/vending_machine_test')
    end
  end
end
