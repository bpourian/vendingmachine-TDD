class VendingMachine

  def print_snacks(list_of_snacks = @list_of_snacks)
    return "Snack Machine empty" if list_of_snacks == nil

    list_of_snacks.each do |item|
      puts "#{list_of_snacks.index(item)+1} #{item[:name]} -- £#{sprintf('%.2f', item[:price])}"
    end
  end

  def select_snack(snack_number)
    @snack_number = snack_number
    puts "Selection: #{@list_of_snacks[snack_number - 1][:name]}"+
    " -- amount due: £#{sprintf('%.2f', @list_of_snacks[snack_number - 1][:price])}"
  end

  def insert_money
    print "Insert Money here:"
    calculate_change($stdin.gets.chomp.to_f)
  end

  def calculate_change(amount_paid = @amount_paid, snack_number = @snack_number)
    amount_paid -= (@list_of_snacks[snack_number - 1][:price])
    return "Your change: #{sprintf('%.2f',amount_paid)}" if amount_paid >= 0
    "Amount due: £#{sprintf('%.2f',amount_paid.abs())}"
  end

  def load_snacks(snacks)
    @list_of_snacks = snacks
  end
end
