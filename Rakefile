require 'pg'

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'vending_machine_test')
  # Clear the database
  connection.exec("TRUNCATE Snacks;")
  connection.exec("TRUNCATE Change;")

end

task :create_table_snacks do
  p "creating snacks table..."

  ['vending_machine_dev', 'vending_machine_test'].each do |database|
    con = PG.connect :dbname => database

    con.exec "DROP TABLE IF EXISTS Snacks"
    con.exec "CREATE TABLE Snacks(Id INTEGER PRIMARY KEY,
        Product VARCHAR(20), Price INT);"
  end
end

task :create_table_change do
  p "creating change table..."

  ['vending_machine_dev', 'vending_machine_test'].each do |database|
    con = PG.connect :dbname => database

    con.exec "DROP TABLE IF EXISTS Change"
    con.exec "CREATE TABLE Change(Id INTEGER PRIMARY KEY,
        Value VARCHAR(20), Quantity INT);"
  end
end

task :setup do
  p "Creating databases..."

  ['vending_machine_dev', 'vending_machine_test'].each do |database|
    con = PG.connect
    con.exec "DROP DATABASE IF EXISTS #{ database }"
    con.exec("CREATE DATABASE #{ database };")
  end
end
