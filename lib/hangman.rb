def get_word
  dictionary = File.readlines "lib/5desk.txt"
  wordindex = Random.new.rand(0..10000)
  word = dictionary[wordindex]
  return word unless word.length < 5 && word.length > 12
end
target = get_word
turns = 5
