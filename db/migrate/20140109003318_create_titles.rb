class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :title
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
