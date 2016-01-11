class PoemSerializer < ActiveModel::Serializer
  attributes :id, :text, :source_user, :created_at, :created_at_str

  belongs_to :user

  def created_at_str
    pretty_timestamp('created_at')
  end

  private

  def pretty_timestamp(property_name)
    if (time = object.send(property_name)).is_a? ActiveSupport::TimeWithZone
      time.strftime("%B %-e, %Y, %-l:%M %P")
    else
      Rails.logger.warn "Warning: non-TimeWithZone object passed to Poem#pretty_timestamp"
      time.to_s
    end
  end
end
