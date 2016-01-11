class Poem < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :source_user, length: { minimum: 1 }
  validates :text, length: { minimum: 1 }

  after_create do |poem|
    word_count = poem.text.split(/\s/).size
    poem.user.add_to_word_count(word_count)
  end

end
