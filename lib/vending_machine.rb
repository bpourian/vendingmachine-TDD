class VendingMachine

  def initialize(list_of_snacks)
    @list_of_snacks = list_of_snacks;
  end

  def show_snacks
    @list_of_snacks.each do |item|
      puts "#{@list_of_snacks.index(item)+1} #{item[:name]} -- £#{sprintf('%.2f', item[:price])}"
    end
  end

  def select_snack(snack_number)
    puts "Selection: #{@list_of_snacks[snack_number - 1][:name]}"+
    " -- amount due: £#{sprintf('%.2f', @list_of_snacks[snack_number - 1][:price])}"
  end

  def insert_money
    print "Insert Money here:"
    amountPaid = $stdin.gets.chomp.to_i
    amountPaid = sprintf('%.2f',amountPaid)
  end

end
