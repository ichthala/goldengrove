class Title < ActiveRecord::Base
  attr_accessible :image, :title, :description, :check

  has_and_belongs_to_many :users
end
