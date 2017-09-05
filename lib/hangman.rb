class Hangman
  def initialize
    @turns = 10
    @target = get_word.downcase
    @display = Array.new(@target.length, "_")
  end

  def get_word
    dictionary = File.readlines "lib/5desk.txt"
    wordindex = Random.new.rand(0..10000)
    word = dictionary[wordindex]
    return word unless word.length < 5 && word.length > 12
  end

  def check_word(guess)
    if @target.include?(guess)
      x = @target.split("")
      matches = x.each_index.select{|g| @target[g] == guess}
      matches.each { |g| @display[g] = guess}
    else
      puts "You got that one wrong!"
    end
  end

  def game
    while @turns > 0
      puts "You have #{@turns} turns left!"
      puts "Your result so far: #{@display}"
      puts "What is your next guess?"
      guess = gets.chomp
      result = check_word(guess)
      @turns -= 1
    end
  end
end
hangman = Hangman.new
hangman.game
