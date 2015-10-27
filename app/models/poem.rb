class Poem < ActiveRecord::Base
  # attr_accessible :source_user, :text

  belongs_to :user

  validates :user, presence: true
  validates :source_user, length: { minimum: 1 }
  validates :text, length: { minimum: 1 }

  after_create do |poem|
    word_count = poem.text.split(/\s/).size
    poem.user.add_to_word_count(word_count)
  end

  def as_json(opts = {})
    super(opts).merge(
      { "created_at_str" => pretty_timestamp(:created_at) }
    )
  end

  # override serializable_hash in order to properly represent
  # poem when it's included as a nested resource
  def serializable_hash(opts = {})
    hash = super(opts)
    # TODO: move this into a presenter
    h = hash.merge(
      { "created_at_str" => pretty_timestamp(:created_at) }
    )
    h
  end

  private

  def pretty_timestamp(property_name)
    if (time = self.send(property_name)).is_a? ActiveSupport::TimeWithZone
      time.strftime("%B %-e, %Y, %-l:%M %P")
    else
      Rails.logger.warn "Warning: non-TimeWithZone object passed to Poem#pretty_timestamp"
      time.to_s
    end
  end

end
