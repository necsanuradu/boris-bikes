class Bike
  def working?
    return true
  end

  def dock_bike_working?
    puts "If the bike is not working or is not suitable for transportation?"
    puts "please press the N key"
    puts "else hit return"
    #if defined?($in_spec_test).nil?
      get_user_bike_working?
    #else
      #get_user_bike_working?("")
    #end
  end

  def get_user_bike_working?(working = STDIN.gets.chomp.downcase)
    working == "n" ? false : true
  end
end