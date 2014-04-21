require 'word_trie'

class PoeTrie

  class << self
    attr_accessor :poe_trie
  end

  def self.build
    puts 'Building Poe trie...'
    poe_all = ''

    File.open( (File.join(Rails.root, "lib", "assets", "poe.txt")) , "r") do |file|
      poe_all = file.read
    end

    poe_all = poe_all.downcase.gsub(/[^a-z\s]/, '').split

    # convert the string to an array of 3-word sequences
    three_word_sequences = []

    poe_all.each_with_index do |word, index|
      str = word
      str.concat(" #{poe_all[index+1]}")
      str.concat(" #{poe_all[index+2]}")
      three_word_sequences << str
      # print "."
    end

    # puts "I have #{three_word_sequences.count} three-word sequences."
    # puts "Here are the first five:"

    # puts "#{three_word_sequences[0..4]}"

    # add every 3-word sequence to the trie
    @poe_trie = WordTrie.new
    three_word_sequences.each do |seq|
      @poe_trie.build(seq)
    end

    # test the trie
    # puts "I expect 'upon a midnight' to return true."
    # puts "It returns #{find('upon a midnight')}."
    # puts "I expect 'alice and octopus' to return nil."
    # puts "Does it return nil? #{find('alice and octopus') == nil}."
    puts 'Poe Trie complete.'
  end

  def self.find(seq)
    seq = seq.split unless seq.is_a? Array
    @poe_trie.find(seq)
  end

end