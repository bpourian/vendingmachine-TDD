class VendingMachine

  def initialize(list_of_snacks)
    @list_of_snacks = list_of_snacks;
  end

  def show_snacks
    @list_of_snacks.each do |item|
      puts "#{@list_of_snacks.index(item)+1} #{item[:name]} -- £#{sprintf('%.2f', item[:price])}"
    end
  end

end
