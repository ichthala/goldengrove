class TitleChecker

  def initialize(options)
    @user = options[:user]
    @poem = options[:poem]
  end

  def check_for_titles
    all_titles = Title.all
    previous_earned_titles = @user.titles
    titles_to_check = all_titles - previous_earned_titles
    earned_titles = []

    titles_to_check.each do |title|
      earned_titles << title if self.send("#{title.check}".to_sym)
    end
    # binding.pry
    earned_titles
  end

  def apprentice_wordsmith
    @user.poems.count >= 1
  end

  def lord_tennyson
    @user.poems.count >= 10
  end

  def let_us_go
    @poem.text.length <= 70
  end

  def wordsworthy
    @user.word_count >= 100
  end

  def tweet_brigade
    @user.word_count >= 600
  end

  def byronic_hero
    words = @poem.text.downcase.gsub(/[^a-z\s]/, '').split

    byronic_words = [
      'byronic',
      'brooding',
      'moody',
      'sorrow',
      'tempestuous',
      'moors',
      'stormy',
      'tortured',
      'loss',
      'angst',
      'vampire',
      'heathcliff',
      'sorrowful',
      'wistful',
      'longing',
      'pining',
      'suffering',
      'depression',
      'depressed',
      'sad',
      'sadness',
      'agony',
      'bipolar'
    ]

    words.each do |word|
      if byronic_words.include?(word)
        return true
      end
    end

    false
  end

  def poe_trie
    words = @poem.text.downcase.gsub(/[^a-z\s]/, '').split

    words.each_with_index do |word, i|
      seq = [word, words[i+1], words[i+2]]
      return true if PoeTrie.find(seq)
    end

    false
  end

  def lovecraftian
    words = @poem.text.downcase.gsub(/[^a-z\s]/, '').split

    lovecraft_words = [
      'lovecraft',
      'yogsothoth',
      'shoggoth',
      'shubniggurath',
      'cthulhu',
      'rlyeh',
      'kadath',
      'ulthar',
      'azathoth',
      'celephais',
      'nyarlathotep',
      'necronomicon',
      'alhazred',
      'fhtagn',
      'arkham',
      'dunwich',
      'miskatonic',
      'leng',
      'eldritch',
      'noneuclidean',
      'innsmouth',
      'tsathoggua',
      'dagon',
      'tekelili'
    ]

    words.each do |word|
      if lovecraft_words.include?(word)
        return true
      end
    end

    false
  end

  def duke_of_repartee
    poems = Poem.where(source_user: @user.twitter_handle)
    matching_poems = poems.select do |poem|
      poem.user != @user
    end
    matching_poems.size > 0
  end

  def rake_progressing
    words = @poem.text.downcase.gsub(/[^a-z\s]/, '').split

    rake_words = [
      'fuck',
      'fucking',
      'fucked',
      'shit',
      'shitting',
      'shite',
      'whore',
      'sex',
      'orgy',
      'brothel',
      'gambling',
      'booze',
      'liquor',
      'beer',
      'beers',
      'cock'
    ]

    words.each do |word|
      return true if rake_words.include?(word)
    end

    false
  end

end