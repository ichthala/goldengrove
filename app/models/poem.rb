class Poem < ActiveRecord::Base
  attr_accessible :source_user, :text

  belongs_to :user

  # validates :user, presence: true
  # validates :source_user, length: {minimum: 1}
  validates :text, length: {minimum: 1, maximum: 140}
end
