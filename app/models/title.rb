class Title < ActiveRecord::Base
  attr_accessible :image, :title, :description, :check

  has_many :user_titles
  has_many :users, through: :user_titles
end
