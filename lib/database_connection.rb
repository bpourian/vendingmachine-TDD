require 'pg'

class DatabaseConnection

  def self.setup(database)
    @connection = PG.connect(database)
  end

end
