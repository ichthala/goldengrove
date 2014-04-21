class WordTrie

  def initialize
    @root = Hash.new
  end

  def build(str)
    node = @root
    words = str.split
    words.each do |word|
      node[word] ||= Hash.new
      node = node[word]
    end
    node[:end] = true
  end

  def find(seq)
    node = @root
    seq.each do |word|
      return nil unless node = node[word]
    end
    node[:end] && true
  end

end