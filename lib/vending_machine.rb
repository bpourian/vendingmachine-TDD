require 'pg'
require_relative './database_connection'

class VendingMachine

  def initialize
    @list_of_snacks = []
  end

  def print_snacks(all_snacks = load_snacks_from_db())

     if all_snacks.nil?
      puts "Snack Machine empty"
      return
     end

    all_snacks.each do |item|
      puts "#{item["id"]} #{item["product"]} -- £#{sprintf('%.2f', item["price"])}"
    end
  end

  def select_snack(snack_number, snack_list = @list_of_snacks)
    @snack_price = snack_list[snack_number - 1][:"price"]
    puts "Selection: #{snack_list[snack_number - 1][:"product"]}"+
    " -- amount due: £#{sprintf('%.2f', snack_list[snack_number - 1][:"price"])}"
  end

  def insert_money
    print "Insert Money here:"
    calculate_change($stdin.gets.chomp.to_f)
  end

  def calculate_change(amount_paid , snack_price = @snack_price)
    amount_paid -= snack_price
    return "Your change: #{sprintf('%.2f', amount_paid)}" if amount_paid >= 0
    "Amount due: £#{sprintf('%.2f', amount_paid.abs())}"
  end

  def load_snacks_to_db(snacks, database_name)
    database_name = database_name || 'vending_machine_dev'
    con = DatabaseConnection.connect(database_name)
    position = 1

    snacks.each do |item|
      con.exec("INSERT INTO Snacks VALUES(#{position},'#{item[:product]}',#{item[:price].to_f})")
      position += 1
    end
    con.close if con
  end

  def load_change_to_db(change, database_name)
    database_name = database_name || 'vending_machine_dev'
    con = DatabaseConnection.connect(database_name)
    position = 1

    change.each do |item|
      con.exec("INSERT INTO Change VALUES(#{position}, '#{item[:name]}', #{item[:value]})")
      position += 1
    end
    con.close if con
  end

  private

  def load_snacks_from_db(database_name = 'vending_machine_test')
    DatabaseConnection.connect(database_name)
    result = DatabaseConnection.query("SELECT * FROM Snacks;")

    return nil if result.num_tuples.zero?

    result.each do |row|
      @list_of_snacks << row
    end
    @list_of_snacks
  end

end
