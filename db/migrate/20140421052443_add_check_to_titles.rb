class AddCheckToTitles < ActiveRecord::Migration
  def change
    add_column :titles, :check, :string
  end
end
