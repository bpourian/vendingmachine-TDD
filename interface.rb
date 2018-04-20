require './lib/vending_machine'

class Interface
  def initialize(machine = VendingMachine.new)
    @machine = machine
  end

  def show_commands
    arr = ["machine.print_snacks -> To print snack menu",
      "machine.select_snack(snack number) -> To select a snack from the menu",
      "load_snacks_db(snack_data) -> To load your db with snacks run this command",
      "snack_data -> To take the hassle of loading data you can use this"]

      arr.each { |item| puts item }
  end

  def print_snacks
    @machine.print_snacks()
  end

  def select_snack(number)
    @machine.select_snack(number)
    @machine.insert_money()
  end

  def load_snacks_db(list)
    @machine.load_snacks_to_db(list)
  end

  def snack_data
     [{ :"product" => "Walkers Crisps", :"price" => 0.50 },
      { :"product" => "Snicker", :"price" => 1 },
      { :"product" => "Coke", :"price" => 1 },
      { :"product" => "Twix", :"price" => 1 },
      { :"product" => "Polo", :"price" => 0.50 },
      { :"product" => "Sprite", :"price" => 1 }]
  end
end
