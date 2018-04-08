require 'pg'

task :test_database_setup do
  # p "Cleaning database..."

  con = PG.connect(dbname: 'vending_machine_test')
  con.exec("TRUNCATE Snacks;")
  con.exec("TRUNCATE Change;")
  con.close if con
end

task :dev_database_setup do
  # p "Cleaning database..."

  con = PG.connect(dbname: 'vending_machine_dev')
  con.exec("TRUNCATE Snacks;")
  con.exec("TRUNCATE Change;")
  con.close if con
end

task :create_table_snacks do
  p "creating snacks table..."

  ['vending_machine_dev', 'vending_machine_test'].each do |database|
    con = PG.connect :dbname => database

    con.exec "DROP TABLE IF EXISTS Snacks"
    con.exec "CREATE TABLE Snacks(Id INTEGER PRIMARY KEY,
        Product VARCHAR(20), Price FLOAT);"
    con.close if con
  end
end

task :create_table_change do
  p "creating change table..."

  ['vending_machine_dev', 'vending_machine_test'].each do |database|
    con = PG.connect :dbname => database

    con.exec "DROP TABLE IF EXISTS Change"
    con.exec "CREATE TABLE Change(Id INTEGER PRIMARY KEY,
        Name VARCHAR(20), Value FLOAT);"
    con.close if con
  end

end

task :setup do
  p "Creating test and dev databases..."

  ['vending_machine_dev', 'vending_machine_test'].each do |database|
    con = PG.connect
    con.exec "DROP DATABASE IF EXISTS #{ database }"
    con.exec("CREATE DATABASE #{ database };")
    con.close if con
  end

end
