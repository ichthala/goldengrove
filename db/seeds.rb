# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Poem.delete_all
Title.delete_all

Title.create(title: "Apprentice Wordsmith",
  description: "You wrote your first poem on Goldengrove!",
  image: "title-first.png",
  check: "apprentice_wordsmith")

Title.create(title: "Lord Tennyson",
  description: "You wrote your 10th poem on Goldengrove!",
  image: "title-tennyson.png",
  check: "lord_tennyson")

Title.create(title: "Let Us Go Through Certain Half-Deserted Tweets",
  description: "You wrote a poem with 70 or fewer characters.",
  image: "title-let-us.png",
  check: "let_us_go")

Title.create(title: "Wordsworthy",
  description: "You've written 100 words on Goldengrove!",
  image: "title-wordsworthy.png",
  check: "wordsworthy")

Title.create(title: "Charge of the Tweet Brigade",
  description: "You've written 600 words on Goldengrove!",
  image: "title-tweet-brigade.png",
  check: "tweet_brigade")

Title.create(title: "Byronic Hero",
  description: "Byron himself would be proud of your brooding words!",
  image: "title-byronic.png",
  check: "byronic_hero")

Title.create(title: "Poe-Trie",
  description: "Quoth the Raven: Forevermore! You used a three-word sequence that also appears in the poems of Edgar Allan Poe.",
  image: "title-poe.png",
  check: "poe_trie")

Title.create(title: "Lovecraftian",
  description: "That is not dead which can eternal tweet / And with strange poems, even strangers meet.",
  image: "title-lovecraftian.png",
  check: "lovecraftian")

Title.create(title: "Duke of Repartee",
  description: "You replied to someone who wrote you a poem.",
  image: "title-repartee.png",
  check: "duke_of_repartee")

Title.create(title: "Rake, Progressing",
  description: "What a filthy libertine you are!",
  image: "title-rake.png",
  check: "rake_progressing")
